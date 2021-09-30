# fms_server.py -- Main Server Program File for EpicFms Server
# dlb, Sept 2021
#
# 
#

from flask import Flask, render_template
from threading import Event
import datetime
import timercb
import score_manager as sm
import time

game_status = {
      'team_a' : '---',
      'team_b': '---', 
      'etime' : '---'
}
loopcount = 0
score_man  = sm.ScoreManager() 
score_man.update()

# Main loop here.  Does work that is not the web server.
def mainloop():
    global game_status, loopcount, score_man
    score_man.update()

    loopcount += 1
    game_status['etime'] = '%d Seconds' % loopcount
    if loopcount == 20:
        game_status['team_a'] = 'babies'
        game_status['team_b'] = 'soliders'

doneevent = Event()
looptimer_thread = timercb.TimerCB(mainloop, 0.100, doneevent)
looptimer_thread.start()
time.sleep(0.200)

# Setup the Web Server
webapp = Flask(__name__)
@webapp.route("/")
def hello():
   now = datetime.datetime.now()
   timeString = now.strftime("%Y-%m-%d %H:%M")
   stuff = {'title' : 'Hi There'}
   return render_template('index.html', **game_status)

@webapp.route("/score")
def score():
   templateData = {
      'team_a' : 'elders',
      'team_b': 'bad boys', 
      'etime' : '45 Secs'
      }
   return render_template('scoreboard.html', **game_status)

# Rawscore returns JSON text that describes the complete state of the game
@webapp.route("/rawscore")
def rawscore():
    global loopcount, score_man
    return score_man.get_state()
# Start the Web server here.
webapp.run(host='0.0.0.0', port=80, debug=True)