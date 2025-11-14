# score_sender.py -- Prepares the score for communicating with javascript
# dlb, Sept 2021
# Updated for SideQuest, Nov 2025

# The main purpose of these classes is to control the scoreboard display by
# preparing JSON that is sent to the scoreboard page.  The scoreboard page's 
# javascript interperts the JSON to display the score and status of the game.

import json
import time
import game_manager

class ScoreSender():
    def __init__(self):
        self.text = ''
        self.score = {  # These also work with javascript via json.
            "Title" :game_manager.get_game_name(),
            "GameMode" : "Standby",  # Stuff like: 'Error, Standby, Countdown, GameOn, PostGame" 
            "Timer" : "0:00", # Value to display on the timer -- may not be an integer!
            "TimerLabel" : " ",  
            "Score" : 0, 
            "Hits" : [0, 0, 0, 0, 0, 0],
            "Doors" : [" ", " ", " ", " ", " ", " "],
            "Links" : [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            "TotalHits" : 0,
            "TotalLinks" : 0 
        }
        self.t0 = time.monotonic()
        self.update_count = 0
        self.doing_test = False 

    def testing(self, enable):
        self.doing_test = enable 

    def clear(self):
      self.score["Title"] = game_manager.get_game_name()
      self.score["GameMode"] = "Standby"
      self.score["Timer"] = "0"
      self.score["TimerLabel"] = " "
      self.score["Score"] = 0
      self.score["Hits"] = [0, 0, 0, 0, 0, 0]
      self.score["Doors"] = [" ", " ", " ", " ", " ", " "]
      self.score["Links"] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
      self.score["TotalHits"] = 0,
      self.score["TotalLinks"] = 0

    def load_current_score(self):
        self.score["Title"] = game_manager.get_game_name()
        self.score["GameMode"] = game_manager.get_gamemode()
        self.score["Timer"] = game_manager.get_time() 
        self.score["TimerLabel"] = " "
        self.score["Score"] = game_manager.get_totalscore()
        self.score["Hits"] = game_manager.get_hits()
        self.score["Doors"] = game_manager.get_doors()
        self.score["Links"] = game_manager.get_links()
        self.score["TotalHits"] = game_manager.get_totalhits()
        self.score["TotalLinks"] = game_manager.get_totallinks()

    def update(self):
        # Update will be called about 10 Hz. 
        self.load_current_score()
        self.update_count += 1

    def get_state(self):
        tout = json.dumps(self.score) 
        return tout

if __name__ == "__main__":
   sm = ScoreSender()
   sm.update()
   t = sm.get_state()
   print("Json: ", t)  
