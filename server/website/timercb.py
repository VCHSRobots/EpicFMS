# timercb.py -- Used to schedule regular spaced callbacks
# 
#
from threading import Thread, Event
import time

class TimerCB(Thread):
    def __init__(self, cb, period, stopevent):
        '''Init -- Pass in the callback, period and an Event.
        Set the event to stop the callback timer.'''
        self.cb = cb
        self.period = period
        self.stopevent = stopevent
        Thread.__init__(self)
    def run(self):
        while not self.stopevent.wait(self.period):
            self.cb()

if __name__ == "__main__":
    def sayhi():
        print("Hi.")
    stopit = Event()
    tcb = TimerCB(sayhi, 1.0, stopit)
    print("Starting the Thread.")
    tcb.start()
    time.sleep(6.5)
    print("Stopping the Thread.")
    stopit.set()
    time.sleep(5.0)
