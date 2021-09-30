# score_manager.py -- Keeps the acutal Score and full state of the game
# dlb, Sept 2021

import json
import time

class ScoreManager():
    def __init__(self):
        self.text = ''
        self.game_state = { 
            "Mode" : "Standby",  # 'Error, Standby, Countdown, GameOn, AfterGame" 
            "GameState" : "Off", # Off, Auto, Tele, EndGame
            "Countdown" : 0, # Time to Go before Game Start, Typically a 5 sec countdown after standby
            "GameTimeToGo" : 300, # Time left if the game is active (i.e., Mode = GameOn)
            "GameStateTimeToGo" : 10, # Time to Go on current GameState
            "TargetStatus" : { # A False for any target indicates field Error
                "Blue" : { "Basket" : True, "Sliders" : True, "Moving" : True },
                "Red"  : { "Basket" : False, "Sliders" : True, "Moving" : True }
            },
            "RawHitsInAuto" : {
                "Blue" : { "Basket" : 5, "SliderTop" : 3, "SliderMid" : 4, "SliderBot" : 2, "Moving" : 0 },
                "Red"  : { "Basket" : 5, "SliderTop" : 3, "SliderMid" : 4, "SliderBot" : 2, "Moving" : 0 }
            },
            "RawHitsInTele" : {
                "Blue" : { "Basket" : 5, "SliderTop" : 3, "SliderMid" : 4, "SliderBot" : 2, "Moving" : 0 },
                "Red"  : { "Basket" : 5, "SliderTop" : 3, "SliderMid" : 4, "SliderBot" : 2, "Moving" : 0 }
            },
            "RawHitsInEndGame" : {
                "Blue" : { "Basket" : 5, "SliderTop" : 3, "SliderMid" : 4, "SliderBot" : 2, "Moving" : 0 },
                "Red"  : { "Basket" : 5, "SliderTop" : 3, "SliderMid" : 4, "SliderBot" : 2, "Moving" : 0 }
            },
            "BlueTeamName" : "blue",
            "RedTeamname" : "red",
            "BlueScore" : 500,
            "RedScore" : 500 }
        self.t0 = time.monotonic()

    def update(self):
        t = int(time.monotonic() - self.t0)
        self.game_state["GameTimeToGo"] = t

    def get_state(self):
        tout = json.dumps(self.game_state) 
        return tout 

if __name__ == "__main__":
   sm = ScoreManager()
   sm.update()
   t = sm.get_state()
   print("Json: ", t)  
