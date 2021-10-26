# fmslogger.py -- Logger for fms data
# dlb, Oct 2021 

# This logger separates logging events that have to do with web operations
# from fms logic.  This logger is to log operations in the webside that
# deal with fms. 

import threading
import timercb
import time
import os

queue_lock = threading.Lock()
output_queue = []
lost_lines = False
logf = None
log_thread = None
log_quit = False
log_wait_count = 0

def get_file_name():
    tm = time.localtime()
    str = "log/fmslog_%04d-%02d-%02d.txt" % (tm.tm_year, tm.tm_mon, tm.tm_mday)
    return str

def get_timestamp():
    tm = time.localtime() 
    str = "%02d:%02d:%02d" % (tm.tm_hour, tm.tm_min, tm.tm_sec)
    return str

def start():
    # starts a background task that writes lines in the queue to 
    # the output file: log/fmslog_yyyy-mm-dd.txt
    global logf, log_thread, lost_lines
    if log_thread is not None: return  
    if not os.path.isdir("log"):
        os.mkdir("log") 
    fn = get_file_name()

    try: 
        logf = open(fn, "a")
    except BaseException as err:
        print("Unable to open log file. Error: {0}".format(err))
        logf = None
    if logf is not None:
        logf.write("***************** Log Start: " + time.ctime() + "\n")
    log_thread = threading.Thread(target=process_queue, name="fms_logging")
    log_thread.start()

def log(str):
    global lost_lines, logf, output_queue
    # Put a line on the log
    line = get_timestamp() + "> " + str + "\n"
    queue_lock.acquire()
    if not lost_lines:
        n = len(output_queue) 
        if n < 400: output_queue.append(line)
        else: lost_lines = True
    queue_lock.release()

def kill_logger():
    global log_quit
    log_quit = True

def process_queue():
    global logf, log_thread, lost_lines, log_wait_count, log_quit
    while True:
        if logf is not None:
            while True:
                line = None
                flag = False
                queue_lock.acquire()
                n = len(output_queue)
                if n > 0:
                    line = output_queue.pop(0)
                else:
                    if lost_lines: 
                        flag = True
                        lost_lines = False
                queue_lock.release()
                if flag: 
                    logf.write("!!!!!!!!!!!!  LOST LINES !!!!!!!!!!!")
                    logf.flush()
                if line is not None:
                    logf.write(line) 
                    logf.flush()
                else: break
        log_wait_count += 1
        time.sleep(.2)
        if log_quit: return
            
        





