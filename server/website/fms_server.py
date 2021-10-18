# fms_server.py -- Main Server Program File for EpicFms Server
# dlb, Sept 2021
#

from flask import Flask, render_template, request
from threading import Event
import json
import datetime
import basket_unit
import timercb
import score_sender
import time
import security

mode_testing = True   # Set to test all features on the scoreboard
webapp = Flask(__name__)
doneevent = Event()
loopcount = 0
scoreoutput  = score_sender.ScoreSender() 
scoreoutput.update()
scoreoutput.testing(True)  # Remove this for production 
dummy_params = { "dummy" : 0}
pw_manager = security.Security()
basket_unit = basket_unit.BasketUnit()

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
    # Handle password attemps
    pw = request.args.get("pw", "NOT-GIVEN")
    logout = request.args.get("logout", -1)
    if pw != "NOT-GIVEN":
        pw_manager.attempt_login(request.remote_addr, pw)
    if logout != -1:
        pw_manager.log_out(request.remote_addr)
    if request.args.get("motor", -1) != -1:
      enable = int(request.args.get("motor", 0))
      print("Enable = ", enable)
      if enable == 1: basket_unit.turn_motor_on()
      else:           basket_unit.turn_motor_off()
    return render_template('admin.html', **dummy_params)

  @webapp.route("/basket")
  def basket():
    return render_template('basket.html', **dummy_params)

  # Rawscore returns JSON text that describes the complete state of the game
  @webapp.route("/rawscore")
  def rawscore():
      global loopcount, scoreoutput
      return scoreoutput.get_state()

  # Rawstatus returns JSON text for the administration of the game
  @webapp.route("/rawstatus")
  def rawstatus():
    okay = pw_manager.is_loggedin(request.remote_addr)
    nhits = basket_unit.get_hits()
    status = {"LoggedIn" : okay, "Hits" : nhits}
    tout = json.dumps(status) 
    return tout

# Main loop here.  Does work that is not the web server.
def mainloop():
    global loopcount, scoreoutput
    scoreoutput.update()
    pw_manager.clean_up(7200)   # Require new login every 2 hours
    loopcount += 1

# Start the background main loop here
setup()
looptimer_thread = timercb.TimerCB(mainloop, 0.100, doneevent)
looptimer_thread.start()

# Start other background activities
basket_unit.begin()

# Start the Web server here.
webapp.run(host='0.0.0.0', port=80, debug=True)