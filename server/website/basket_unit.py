# basket_unit.py -- manages interactions with the basket target
# dlb, Oct 2021

import json
from json.decoder import JSONDecodeError
import timercb
import threading
import requests
import time
import gamemode

requried_status_keys = ["unit", "switch", "gamemode", "mainloop_count", "hits", 
"motor_enabled", "in_jam", "jam_count", "stuck", "rpm", "pwm", "run_pwm", "encoder", "hitdetector_status", "batvolts"]

class BasketUnit():
    _basket_count = 0
    def __init__(self, ip="10.0.2.43"):
        self.ip = ip
        self.status = {} # dict containing decoded status response
        self.connected = False   # flag to indicate connection status
        self.progerror = 0       # flag programming errors (non-zeros)
        self.hits = 0            # Total number of hits recorded
        self.last_main_loop_count = 0 # main loop count at last update.
        self.last_nhits = 0      # last number of hits reported
        self.validstatus = False
        self.last_successful_status_update = 0.0
        self.status_update_count = 0
        self.telp_to_update = 0
        self.command_pending = False 
        self.command = ""
        self.updatelock = threading.Lock()
        self.cmdlock = threading.Lock()  
        BasketUnit._basket_count += 1
        self.basketid = BasketUnit._basket_count
        self.done_event = threading.Event()
        self.background_thread = timercb.TimerCB(self.run_status_thread, 0.200, self.done_event, "basket_unit")

    def begin(self):
        # Starts the activity in this object. Runs a thread in the 
        # background to continuely gather info from the basket target.
        # self.worker = threading.Thread(target=self.run_status_thread, name="basket-%d" % self.basketid)
        # self.worker.start()
        self.background_thread.start()

    def run_status_thread(self):
        # Ping-pongs between sending commands to the unit and receiving status.  Status is 
        # requested about once a sec, whereas commands are sent within 0.2 seconds if a 
        # new command is pending.  
        nloop = 0
        while(True):
            # Do a fast loop here, polling for commands to send and for times to update
            nloop += 1 
            if nloop >= 5: 
                nloop = 0
                self.get_data()
            self.cmdlock.acquire()
            command_pending = self.command_pending 
            cmd = self.command 
            self.cmdlock.release()
            if command_pending: 
                okay = self.send_command(cmd)
                if okay: 
                    self.cmdlock.acquire()
                    self.command_pending = False 
                    self.cmdlock.release()
            time.sleep(0.2)

    def send_command(self, cmd):
        # Attemps to send a command to the unit.
        try:
            url = "http://" + self.ip + "/command?" + cmd
            rsp = requests.get(url, timeout=1)
            if rsp.status_code != 200:
                self.progerror = 3
                return False
            rsp.close()
        except BaseException as err:  # if we knew all the ways this could fail, change this to be less overarching
            rsp.close()
            print("Error: {0}".format(err))
            self.connected = False
            return True
        self.connected = True
        return True     

    def get_data(self):
        # Attempts to get data from the basket unit.  Should only be called in the background.
        try:
            t0 = time.monotonic()
            url = "http://" + self.ip + "/status"
            rsp = requests.get(url, timeout=1)
            if rsp.status_code != 200:
                self.progerror = 3
                return
            telp = (time.monotonic() - t0) * 1000
            rsp.close()
        except BaseException as err:  # if we knew all the ways this could fail, change this to be less overarching
            print("Error: {0}".format(err))
            self.connected = False
            return
        self.connected = True
        try:
            temp_status = json.loads(rsp.text)
        except JSONDecodeError:
            self.progerror = 1
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

    def clear_command_queue(self):
        # Use this to clear the command queue.  Suitable when it is
        # suppected that the command queue is deadlocked.
        self.cmdlock.acquire() 
        self.command_pending = False 
        self.command = ""
        self.cmdlock.release()

    def turn_motor_on(self):
        # Attemps to turn the motor on.  Returns True if command is
        # successfully put in the command queue.  Use status to 
        # see that it acutally occured sometime later.
        self.cmdlock.acquire() 
        if self.command_pending:
            self.cmdlock.release()
            return False 
        self.command_pending = True 
        self.command = "motor=1" 
        self.cmdlock.release()
        return True

    def turn_motor_off(self):
        # Attemps to turn the motor off.  Returns True if command is
        # successfully put in the command queue.  Use status to 
        # see that it acutally occured sometime later.
        self.cmdlock.acquire() 
        if self.command_pending:
            self.cmdlock.release()
            return False 
        self.command_pending = True 
        self.command = "motor=0" 
        self.cmdlock.release()
        return True

    def set_game_mode(self, gmode):
        # Attemps set the game mode.  The game mode must be one
        # of the official strings given in gamemodes.py. Returns
        # True if command is successfully put in the command
        # queue.  Use status to see that it acutally occured
        # sometime later.
        self.cmdlock.acquire() 
        if self.command_pending:
            self.cmdlock.release()
            return False 
        self.command_pending = True 
        self.command = "gamemode=" + gmode 
        self.cmdlock.release()
        return True

    def run_detector_test(self):
        # Attemps to run a self test on the detector.  Returns
        # True if command is successfully put in the command queue.
        # Use status to see results.  This command will clear a
        # detector error if the detector is currently okay.
        self.cmdlock.acquire() 
        if self.command_pending:
            self.cmdlock.release()
            return False 
        self.command_pending = True 
        self.command = "selftest=1"
        self.cmdlock.release()
        return True     

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
    
    def is_motor_enabled(self):
        # Returns True if the motor is enabled
        if not self.validstatus: return False
        self.updatelock.acquire()
        i = self.status["motor_enabled"] 
        self.updatelock.release()
        if i != 0: return True 
        return False
    
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

    def is_stuck(self):
        # Returns True if the motor is stuck.  If so, the motor should
        # be disabled, then  a human should clear the jam, and then
        # the motor should re-enabled.  This will clear the jam and
        # stuck flags.
        if not self.validstatus: return False
        self.updatelock.acquire()
        i = self.status["stuck"] 
        self.updatelock.release()
        if i != 0: return True
        return False 

    def in_jam(self):
        # Returns True if a jam is being cleared
        if not self.validstatus: return False
        self.updatelock.acquire()
        i = self.status["in_jam"] 
        self.updatelock.release()
        if i != 0: return True
        return False 

    def jam_count(self):
        # Returns the number of jams that have been detected
        if not self.validstatus: return 0
        self.updatelock.acquire()
        i = int(self.status["jam_count"])
        self.updatelock.release()
        return i

    def battery_volts(self):
        # Returns the volts on the input.  The basket should be powered
        # with at least 9.5 volts
        if not self.validstatus: return True
        self.updatelock.acquire()
        v = float(self.status["batvolts"])
        self.updatelock.release() 
        return v

    def battery_okay(self):
        # Returns True if there seems to be enough voltage to run the game.
        v = self.battery_volts() 
        if v > 9.5: return True 
        return False

    def report(self):
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
        fmt = "BasketUnit: Connected=%s, Updates=%d, IsValid=%s, elp=%.2f ms, Age=%s, prg_err=%d" 
        print(fmt % (self.connected, _count, _valid, _telp, time_since_last_update, self.progerror))
        if _valid:
            fmt = "%s = %s"
            for k in requried_status_keys:
                print(fmt % (k.ljust(20), _status[k]))

if __name__ == "__main__":
    b = BasketUnit() 
    b.begin()
    c = 0
    t0 = time.monotonic()
    while(True):
        while(True):
            telp = time.monotonic() - t0
            if telp > 2.5:
                break
        t0 = time.monotonic()
        b.get_data()
        c += 1
        print("")
        print("Report = %d, telp=%5.1f" % (c, telp))
        b.report()
        #time.sleep(2.5)