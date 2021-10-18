# score_sender.py -- Prepares the score for communicating with javascript
# dlb, Sept 2021

# The main purpose of these classes is to control the scoreboard display by
# preparing JSON that is sent to the scoreboard page.  The scoreboard page's 
# javascript interperts the JSON to display the score and status of the game.

import json
import time

class TeamScore():
    # Simple class to layout the team score structure that works with javascript via json.
    def __init__(self):
        self.score = {
            "TeamName" : "??",
            "Score" : 0,
            "ShowWinBanner" : False,
            "GameElement" : { "Basket" : False, "Sliders" : False, "Moving" : False},
            "CheckMarks" :  { "Basket" : False, "Moving" : False, "Slider1" : False,
                                "Slider2" : False, "Slider3" : False },
            "AutoScore" : { "Checkmark" : True, "XMark" : False, "ShowScore": True, "Score": 0 },
            "Grid" : {
                "Auto"   : { "Basket" : "0x0", "Moving" : "0x0", "Sliders" : "0x0" },
                "TeleOp" : { "Basket" : "0x0", "Moving" : "0x0", "Sliders" : "0x0" },
                "EGame"  : { "Basket" : "0x0", "Moving" : "0x0", "Sliders" : "0x0" },
                "Totals" : { "Basket" :   "0", "Moving" :   "0", "Sliders" :   "0" }
            },
            "ShowLastLine" : True,
            "Raking" : "0",
            "Adjustment" : "0"
        }
    def get_score(self):
        return self.score

class ScoreSender():
    def __init__(self):
        self.text = ''
        blue_score = TeamScore().get_score()
        red_score = TeamScore().get_score()
        self.score = {  # These also work with javascript via json.
            "Title" : "FOAM BALL BASH",
            "GameMode" : "Standby",  # Stuff like: 'Error, Standby, Countdown, GameOn, PostGame" 
            "TimerLabel" : "Off", # Stuff like: Off, Auto, TeleOp, EndGame
            "Timer" : "0", # Value to display on the timer -- may not be an integer!
            "Blue"  : blue_score,
            "Red" : red_score
        }
        self.t0 = time.monotonic()
        self.update_count = 0
        self.ii = 0
        self.doing_test = False 

    def testing(self, enable):
        self.doing_test = enable 

    def update(self):
        # Update will be called about 10 Hz.  
        self.update_count += 1
        t = int(time.monotonic() - self.t0)
        if self.doing_test:
            self.send_test_board()
            return

    def get_state(self):
        tout = json.dumps(self.score) 
        return tout

    def set_checks(self, basket, moving, slider1, slider2, slider3):
        x = {"Basket" : basket, "Moving" : moving, "Slider1" : slider1,
             "Slider2" : slider2, "Slider3" : slider3}
        return x 

    def set_gameelements(self, basket, moving, slider):
        x = {"Basket" : basket, "Moving" : moving, "Slider" : slider }
        return x 
    
    def set_autoscore(self, check, xmark, showscore, score):
        x = { "Checkmark" : check, "XMark" : xmark, "ShowScore": showscore, "Score": score }
        return x

    def load_test_data(self, i):
        data = [{"Auto"  : { "Basket" : "4x6", "Moving" : "1x40", "Sliders" : "22x4" },
                "TeleOp" : { "Basket" : "8x4", "Moving" : "2x20", "Sliders" : "20x2" },
                "EGame"  : { "Basket" : "1x4", "Moving" : "0x20", "Sliders" :  "4x2" },
                "Totals" : { "Basket" :  "60", "Moving" :   "80", "Sliders" :  "136" }},
                {"Auto"  : { "Basket" : "2x6", "Moving" : "0x40", "Sliders" : "10x6" },
                "TeleOp" : { "Basket" : "0x4", "Moving" : "1x20", "Sliders" : "50x3" },
                "EGame"  : { "Basket" : "0x4", "Moving" : "0x20", "Sliders" : "10x3" },
                "Totals" : { "Basket" :  "12", "Moving" :   "20", "Sliders" :  "240" }}]       
        if i == 0: return data[0]
        else:      return data[1]

    def send_test_board(self):
        # Generates a test pattern for the score board to
        # make sure no features are broken when changing css/js/html.
        t = int(time.monotonic() - self.t0)
        bigcycle = (int(self.update_count / 10)) % 10
        #bigcycle should count to 9 and reset, one count per second.
        if bigcycle == 0:
            self.score["GameMode"] == "Standby"
            self.score["TimerLabel"] = " "
            self.score["Timer"] = "--"
            self.score["Blue"]["TeamName"] = "Solders"
            self.score["Red"]["TeamName"] = "Seniors"
            self.score["Blue"]["GameElement"] = self.set_gameelements(True, True, True) 
            self.score["Red"]["GameElement"] = self.set_gameelements(True, True, True)
            self.score["Blue"]["CheckMarks"] = self.set_checks(False, False, False, False, False)
            self.score["Red"]["CheckMarks"] = self.set_checks(False, False, False, False, False)
            self.score["Blue"]["AutoScore"] = self.set_autoscore(False, False, False, 0)
            self.score["Red"]["AutoScore"] = self.set_autoscore(False, False, False, 0)
            self.score["Blue"]["Grid"] = self.load_test_data(0)
            self.score["Red"]["Grid"] = self.load_test_data(1)
        if bigcycle == 1:
            self.score["GameMode"] ="Count Down!!"
            self.score["TimerLabel"] = "Count Down"
            self.score["Timer"] = "9"
            self.score["Blue"]["ShowLastLine"] = True
            self.score["Red"]["ShowLastLine"] = True
            self.score["Blue"]["Raking"] = "23"
            self.score["Blue"]["Adjustment"] = "10"
        if bigcycle > 1:
            self.score["Timer"] = str(int(self.score["Timer"]) - 1)
        if bigcycle == 2:
            self.score["GameMode"] = "Count Down!!!"     
        if bigcycle == 3:
            self.score["GameMode"] = "GAME ON!"
            self.score["TimerLabel"] = "Auto"
            self.score["Red"]["GameElement"]["Basket"] = False
            self.score["Blue"]["GameElement"]["Sliders"] = False
            self.score["Blue"]["CheckMarks"] = self.set_checks(False, True, False, False, True)
            self.score["Red"]["CheckMarks"] = self.set_checks(False, False, True, True, False)
            self.score["Blue"]["AutoScore"] = self.set_autoscore(True, False, True, 25)
            self.score["Red"]["AutoScore"] = self.set_autoscore(False, True, True, 0)
            self.score["Red"]["Raking"] = "10"
            self.score["Red"]["Adjustment"] = "23"
        if bigcycle == 5:
            self.score["Blue"]["TeamName"] = "Cowboys"
            self.score["Red"]["TeamName"] = "Lawyers"
            self.score["GameMode"] = "GAME ON!"
            self.score["TimerLabel"] = "TeleOp"
            self.score["Red"]["GameElement"]["Moving"] = False
            self.score["Blue"]["GameElement"]["Moving"] = False
            self.score["Blue"]["Grid"] = self.load_test_data(1)
            self.score["Red"]["Grid"] = self.load_test_data(0)
        if bigcycle == 7:
            self.score["GameMode"] = "Error"
            self.score["Blue"]["CheckMarks"] = self.set_checks(True, True, True, True, False)
            self.score["Red"]["CheckMarks"] = self.set_checks(True, True, True, True, True)
            self.score["Blue"]["ShowLastLine"] = False
            self.score["Red"]["ShowLastLine"] = False
        if bigcycle == 8:
            self.score["GameMode"] = "PostGame"
            self.score["TimerLabel"] = "Finished"
            self.score["Red"]["GameElement"]["Sliders"] = False
            self.score["Blue"]["GameElement"]["Basket"] = False
        self.score["Blue"]["Score"] = 100 - bigcycle
        self.score["Red"]["Score"] = 20 + bigcycle
 
        nstate = (int(self.update_count / 20)) % 4 
        # nstate should change once every 2 secs
        if nstate == 0:
            self.score["Blue"]["ShowWinBanner"] = False
            self.score["Red"]["ShowWinBanner"]  = False
        if nstate == 1:
            self.score["Blue"]["ShowWinBanner"] = True
            self.score["Red"]["ShowWinBanner"]  = False
        if nstate == 2:
            self.score["Blue"]["ShowWinBanner"] = False
            self.score["Red"]["ShowWinBanner"]  = True
        if nstate == 3:
            self.score["Blue"]["ShowWinBanner"] = True
            self.score["Red"]["ShowWinBanner"]  = True



if __name__ == "__main__":
   sm = ScoreSender()
   sm.update()
   t = sm.get_state()
   print("Json: ", t)  
