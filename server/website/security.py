# security.py -- Manages login attemps for EpicFms server
# dlb, Oct 2021

import time

PASSWORD = "epic4fms"

class Security():
    def __init__(self):
        self.logins = {} # dict of ip addresses, where ip is the key, and value is (okay, t0)

    def attempt_login(self, ip, pw):
        if pw == PASSWORD:
            self.logins[ip] = (True, time.monotonic())
            print("Login From %s Successful." % ip)
            return True
        self.logins[ip] = (False, time.monotonic())
        print("Login From %s Failed." % ip)
        return False

    def is_loggedin(self, ip):
        if not ip in self.logins: return False 
        vin, _ = self.logins[ip]
        return vin

    def log_out(self, ip):
        if not ip in self.logins: return
        _, t0 = self.logins[ip] 
        self.logins[ip] = (False, t0)
        print("Logout from %s Successful." % ip)

    def clean_up(self, telp):
        # removes all logins that are older than telp (in seconds)
        newlist = {}
        tnow = time.monotonic()
        for ip in self.logins.keys():
            v = self.logins[ip]
            if tnow - v[1] < telp:
                newlist[ip] = v 
        self.logins = newlist
