# mover_unit.py -- manages interactions with the mover targets
# dlb, Oct 2021

import json
from json.decoder import JSONDecodeError
import timercb
import threading
import requests
import time
import utils
import gamemode
from fmslogger import log

requried_status_keys = ["unit", "gamemode", "mainloop_count", "command_count", "hits", 
                        "hitdetector_status", "hitdetector_fail_code", "batvolts", "batlow"] 

class MoverUnit():
    _mover_count = 0
    def __init__(self, ip=None):
        self.ip = None 
        self.set_ip(ip)
        self.enable = True       # if set to false, doesn't do much in background.
        self.kill = False        # use to stop background loop and render object inert.
        self.status = {}         # dict containing decoded status response
        self.connected = False   # flag to indicate connection status
        self.progerror = 0       # flag programming errors (non-zeros)
        self.hits = 0            # Total number of hits recorded
        self.last_main_loop_count = 0 # main loop count at last update.
        self.last_nhits = 0      # last number of hits reported
        self.validstatus = False # True if in last 10 secs we had a valid status
        self.last_status_request = 0.0 # Time since a status was requested
        self.last_successful_status_update = 0.0 # Time since a valid status was updated
        self.status_update_count = 0 # Number of valid status received
        self.telp_to_update = 0
        self.status_pending = False 
        self.comm_channel_clear = True
        self.time_of_channel_jam = 0
        self.command_queue = []
        self.updatelock = threading.Lock()
        self.cmdlock = threading.Lock()  
        MoverUnit._mover_count += 1
        self.moverid = MoverUnit._mover_count
        self.done_event = threading.Event()
        self.background_thread = timercb.TimerCB(self.run_status_thread, 0.200, self.done_event, "mover_unit")

    def set_ip(self, ip):
        # Sets IP address.  Turns out the IP can be set at any time.  If set to None, then that
        # effectively disables this unit, although the background loop continues.
        if utils.ip_addr_okay(ip): self.ip = ip
        else: self.ip = None

    def get_ip(self):
        # Returns the ip being used.  If the input was invalid, or not set, None is returned.
        return self.ip
    
    def set_enable(self, enable):
        self.enable = enable

    def destroy(self):
        # Call this to destroy/kill this object. The background loop is stopped. The you can 
        # let the garbage collector kill it.  After calling destroy, do not use any other
        # method on this object.
        self.kill=True

    def begin(self):
        # Starts the activity in this object. Runs a thread in the 
        # background to continuely gather info from the target unit.
        # self.worker = threading.Thread(target=self.run_status_thread, name="slider-%d" % self.sliderid)
        # self.worker.start()
        self.background_thread.start()

    def run_status_thread(self):
        # Ping-pongs between sending commands to the unit and receiving status.  Status is 
        # requested about once a sec, whereas commands are sent within 0.2 seconds if a 
        # new command is pending.  
        nloop = 0
        while(True):
            # Do a fast loop here, polling for commands to send and for times to update
            if self.kill: return
            if self.enable and utils.ip_addr_okay(self.ip):
                if self.validstatus:
                    if time.monotonic() - self.last_successful_status_update > 10.0: 
                        self.validstatus = False
                if not self.comm_channel_clear:
                    if time.monotonic() - self.time_of_channel_jam > 10.0:
                        self.comm_channel_clear = True
                nloop += 1 
                if nloop >= 5: nloop = 0
                if self.comm_channel_clear and nloop == 0: self.get_data() 
                if self.comm_channel_clear:
                    cmd = None
                    self.cmdlock.acquire()
                    if len(self.command_queue) > 0:
                        cmd = self.command_queue.pop()
                    self.cmdlock.release()
                    if cmd is not None: 
                        okay = self.send_command(cmd)
                        if not okay: 
                            self.cmdlock.acquire()
                            self.command_queue.insert(0, cmd) # push it back, try again later
                            self.cmdlock.release()
            time.sleep(0.2)

    def send_command(self, cmd):
        # Attemps to send a command to the unit.
        try:
            url = "http://" + self.ip + "/command?" + cmd
            rsp = requests.get(url, timeout=2)
            if rsp.status_code != 200:
                self.progerror = 3
                return False
            rsp.close()
        except BaseException as err:  # if we knew all the ways this could fail, change this to be less overarching
            rsp.close()
            log("Error: {0}".format(err))
            self.connected = False
            self.comm_channel_clear = False 
            self.time_of_channel_jam = time.monotonic()
            return True
        self.connected = True
        return True     

    def get_data(self):
        # Attempts to get data from the target unit.  Should only be called in the background.
        try:
            t0 = time.monotonic()
            url = "http://" + self.ip + "/status"
            rsp = requests.get(url, timeout=2)
            if rsp.status_code != 200:
                self.progerror = 3
                return
            telp = (time.monotonic() - t0) * 1000
            rsp.close()
        except BaseException as err:  # if we knew all the ways this could fail, change this to be less overarching
            log("Error: {0}".format(err))
            self.connected = False
            self.comm_channel_clear = False 
            self.time_of_channel_jam = time.monotonic()
            return
        self.connected = True
        try:
            temp_status = json.loads(rsp.text)
        except JSONDecodeError:
            self.progerror = 20
            return
        for k in requried_status_keys:
            if not k in temp_status.keys():
                self.progerror = 1
                return
        self.updatelock.acquire()
        self.status = temp_status
        self.validstatus = True
        self.last_successful_status_update = time.monotonic()
        self.status_update_count += 1
        self.telp_to_update = telp
        nhits = int(self.status["hits"])
        mlc = int(self.status["mainloop_count"])
        if mlc >= self.last_main_loop_count: 
            newhits = nhits - self.last_nhits
            if newhits < 0:
                self.progerror = 4  # Number of hits cannot go down!
                newhits = 0
        else:
            # The processor must have restarted. Treat all hits as new
            newhits = nhits
        self.last_main_loop_count = mlc
        self.last_nhits = nhits
        self.hits += newhits 
        self.updatelock.release()
        return 
    
    def get_rawstatus(self):
        # Returns a dict of the raw status obtained from the 
        # unit if it is current to within about 10 secs.  If not,
        # None is returned.
        self.updatelock.acquire()
        valid = self.validstatus
        tempdata = self.status.copy()
        self.updatelock.release()
        if not valid: return None 
        return tempdata

    def clear_command_queue(self):
        # Use this to clear the command queue.  Suitable when it is
        # suppected that the command queue is deadlocked.
        self.cmdlock.acquire() 
        self.command_queue = []
        self.cmdlock.release()

    def add_command_to_queue(self, cmd):
        # Adds a command to the command queue.  Will be executed 
        # in sequence as the comm channel allows. Returns False
        # if the queue is full and cannot accept a new command.
        self.cmdlock.acquire()
        n = len(self.command_queue)
        if (n < 10): self.command_queue.append(cmd)
        self.cmdlock.release()
        if (n >= 10): 
            log("Target Command Queue full!")
            return False 
        return True

    def set_game_mode(self, gmode):
        # Attemps set the game mode.  The game mode must be one
        # of the official strings given in gamemodes.py. Returns
        # True if command is successfully put in the command
        # queue.  Use status to see that it acutally occured
        # sometime later.
        return self.add_command_to_queue("gamemode=" + gmode)

    def run_detector_test(self):
        # Attemps to run a self test on the detector.  Returns
        # True if command is successfully put in the command queue.
        # Use status to see results.  This command will clear a
        # detector error if the detector is currently okay.
        return self.add_command_to_queue("selftest=1")

    def reset_hits_on_unit(self):
        # Attemps to reset the hit count on the device.
        return self.add_command_to_queue("resethits=1")

    def reset_hits(self):
        # Resets the hits logic at the beginning of a game.  Should
        # be called if its known that a recent update has occured.
        self.updatelock.acquire()
        self.hits = 0
        self.updatelock.release()

    def get_hits(self):
        # Returns the number of hits recorded, after "hit logic" 
        # has been applied.
        if not self.validstatus: return 0
        self.updatelock.acquire()
        n = self.hits 
        self.updatelock.release()
        return n
    
    def is_detector_okay(self):
        # Returns True if the detector seems okay.
        if not self.validstatus: return False
        self.updatelock.acquire()
        s = self.status["hitdetector_status"] 
        self.updatelock.release()
        if s == "okay": return True
        if s == "error" or s == "off": return False
        if s == "testing": return False
        return False
    
    def detector_status(self):
        # Returns a short string describing the status of the hit
        # detector.  Possibilities are: "Unknown", "off", "okay",
        # "testing", and "error".
        if not self.validstatus: return "Unknown"
        self.updatelock.acquire()
        s = self.status["hitdetector_status"] 
        self.updatelock.release()
        return s 

    def battery_volts(self):
        # Returns the volts on the input.  The unit should be powered
        # with at least 6.0 volts
        if not self.validstatus: return False
        self.updatelock.acquire()
        v = float(self.status["batvolts"])
        self.updatelock.release() 
        return v

    def battery_okay(self):
        # Returns True if the unit is not reporting battery low.
        if not self.validstatus: return False
        v = self.status["batlow"]
        if (v == 0): return True
        return False

    def report(self):
        # Sends a status report to the log
        self.updatelock.acquire()
        _status = self.status.copy() 
        _count = self.status_update_count
        _lasttime = self.last_successful_status_update
        _valid = self.validstatus
        _telp = self.telp_to_update
        self.updatelock.release()
        if _count > 0:
            telp = time.monotonic() - _lasttime
            if telp < 10: time_since_last_update = "%.3f sec" % telp
            else:
                mins = telp/60.0
                time_since_last_update = "%3.1f mins" % mins
        else:
            time_since_last_update = "Never"
        fmt = "SliderUnit: Connected=%s, Updates=%d, IsValid=%s, elp=%.2f ms, Age=%s, prg_err=%d" 
        log(fmt % (self.connected, _count, _valid, _telp, time_since_last_update, self.progerror))
        if _valid:
            fmt = "%s = %s"
            for k in requried_status_keys:
                log(fmt % (k.ljust(20), _status[k]))

    def is_game_ready(self):
        # Returns true if unit is on-line with no errors.
        if not self.connected: return False 
        if not self.validstatus: return False
        if not self.battery_okay(): return False
        if not self.is_detector_okay(): return False
        return True