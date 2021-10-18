# timercb.py -- Used to schedule regular spaced callbacks
# dlb, Oct 2021  (taken from the web)

from threading import Thread, Event
import time

class TimerCB(Thread):
    _timer_instance_counter = 0
    def __init__(self, cb, period, stopevent, name="unknown"):
        '''Init -- Pass in the callback, period and an Event.
        Set the event to stop the callback timer.'''
        self.cb = cb
        self.period = period
        self.stopevent = stopevent
        TimerCB._timer_instance_counter += 1
        real_name = "TimerCB-%d-%s" % (TimerCB._timer_instance_counter, name)
        Thread.__init__(self, name=real_name)
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
