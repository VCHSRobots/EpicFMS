# fms_server.py -- Main Server Program File for EpicFms Server
# dlb, Sept 2021
#

from flask import Flask, render_template, request
from threading import Event
import json
import datetime
import timercb
import score_sender
import target_manager
import time
import security
import settings
import fmslogger
from fmslogger import log

fmslogger.start()
log("Starting the Epic FMS Server")
mode_testing = True   # Set to test all features on the scoreboard
webapp = Flask(__name__)
doneevent = Event()
loopcount = 0
scoreoutput  = score_sender.ScoreSender() 
scoreoutput.update()
scoreoutput.testing(True)  # Remove this for production 
dummy_params = { "dummy" : 0}
pw_manager = security.Security()
settings.load_settings()
target_manager.set_up_targets()
target_manager.begin_all()

def setup():
  @webapp.route("/")
  def hello():
    now = datetime.datetime.now()
    timeString = now.strftime("%Y-%m-%d %H:%M")
    stuff = {'title' : 'Hi There'}
    return render_template('index.html', **dummy_params)

  @webapp.route("/score")
  def score():
    return render_template('scoreboard.html', **dummy_params)

  @webapp.route("/admin")
  def admin():
    # Handle password and password attemps
    pw = request.args.get("pw", "NOT-GIVEN")
    logout = request.args.get("logout", -1)
    if pw != "NOT-GIVEN":
      pw_manager.attempt_login(request.remote_addr, pw)
      return render_template('admin.html', **dummy_params)
    if logout != -1:
      pw_manager.log_out(request.remote_addr)
      return render_template('admin.html', **dummy_params)
    if not pw_manager.is_loggedin(request.remote_addr):
      return render_template('admin.html', **dummy_params)

    # Temperarily handle general game stuff here
    testmode = request.args.get("scoretestmode", "dummy")
    if testmode != "dummy":
      if testmode == "1":
        scoreoutput.testing(True)
        log("setting test output to true")
      else: 
        log("setting test output to false")
        scoreoutput.testing(False)
        scoreoutput.clear()
      return render_template('admin.html', **dummy_params)
    
    # Handle requests for target units in manager...
    target_manager.process_admin_request(request) 
    return render_template('admin.html', **dummy_params)

  @webapp.route("/basket")
  def basket():
    return render_template('basket.html', **dummy_params)

  # Rawscore returns JSON text that describes the complete state of the game
  @webapp.route("/rawscore")
  def rawscore():
      global loopcount, scoreoutput
      return scoreoutput.get_state()
    
  @webapp.route("/unitstatus")
  def uintstatus():
    j = target_manager.process_unitstatus_request(request) 
    return j

  # Rawstatus returns JSON text for the administration of the game
  # Temp for NOW.  MUST REDO.
  @webapp.route("/rawstatus")
  def rawstatus():
    okay = pw_manager.is_loggedin(request.remote_addr)
    nredhits, nbluehits = target_manager.get_hits()
    status = {"LoggedIn" : okay, "redhits" : nredhits, "bluehits" : nbluehits}
    tout = json.dumps(status) 
    return tout

  #Returns the configuration settings as JSON
  @webapp.route("/getconfig")
  def rawconfig():
    tout = json.dumps(settings.fms_config) 
    return tout

# Main loop here.  Does work that is not the web server.
def mainloop():
    global loopcount, scoreoutput
    scoreoutput.update()
    pw_manager.clean_up(7200)   # Require new login every 2 hours
    loopcount += 1

# Start the background main loop here
log("Starting the main loop thread.")
setup()
looptimer_thread = timercb.TimerCB(mainloop, 0.100, doneevent)
looptimer_thread.start()

# Start the Web server here.
log("Starting the webserver.")
webapp.run(host='0.0.0.0', port=80, debug=True)