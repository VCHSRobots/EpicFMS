# basket_unit.py -- manages interactions with the basket target
# dlb, Oct 2021

import json
from json.decoder import JSONDecodeError
import requests
import time

requried_status_keys = ["unit", "switch", "gamemode", "mainloop_count", "hits", 
"motor_enabled", "in_jam", "jam_count", "stuck", "rpm", "pwm", "run_pwm", "encoder", "hitdetector_status", "batvolts"]

class BasketUnit():
    def __init__(self, ip="10.0.2.43"):
        self.ip = ip
        self.status = {} # dict containing decoded status response
        self.connected = False   # flag to indicate connection status
        self.progerror = 0       # flag programming errors (non-zeros)
        self.validstatus = False
        self.last_successful_status_update = 0.0
        self.status_update_count = 0

    def start_status_thread(self):
        pass

    def get_data(self):
        try:
            url = "http://" + self.ip + "/status"
            rsp = requests.get(url)
        except ConnectionError:
            self.status = {}
            self.connected = False
            self.validstatus = False
            return
        self.connected = True
        try:
            self.status = json.loads(rsp.text)
        except JSONDecodeError:
            print("decode fail")
            self.progerror = 1
            self.status = {}
            self.validstatus = False
            return
        for k in requried_status_keys:
            if not k in self.status.keys():
                print("key %s not in status" % k)
                self.progerror = 1
                self.status = {}
                self.validstatus = False
                return
        self.validstatus = True
        self.last_successful_status_update = time.monotonic()
        self.status_update_count += 1
        return 

    def report(self):
        if self.status_update_count > 0:
            telp = time.monotonic() - self.last_successful_status_update
            time_since_last_update = "%8.1f sec" % telp
        else:
            time_since_last_update = "Never"
        fmt = "BasketUnit. Connected = %s, Updates = %d, Valid Status = %s Time Since Last Update = %s" 
        print(fmt % (self.connected, self.status_update_count, self.validstatus, time_since_last_update))
        if self.validstatus:
            fmt = "%s = %s"
            for k in requried_status_keys:
                print(fmt % (k.ljust(20), self.status[k]))

if __name__ == "__main__":
    b = BasketUnit() 
    while(True):
        b.get_data()
        print("")
        b.report()
        time.sleep(2.0)