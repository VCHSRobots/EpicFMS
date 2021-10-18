# score_manager.py -- Keeps the acutal Score
# dlb, Sept 2021

import json
import time

class ScoreManager():
    def __init__(self):
        self.text = ''
        self.game_state = { 
            "Title" : "FOAM BALL BASH",
            "GameMode" : "Standby",  # Stuff like: 'Error, Standby, Countdown, GameOn, PostGame" 
            "TimerLabel" : "Off", # Stuff like: Off, Auto, TeleOp, EndGame
            "Timer" : "0", # Value to display on the timer -- may not be an integer!
            "GameElement" : { # A False for any elements indicates field Error
                "Blue" : { "Basket" : True, "Sliders" : True, "Moving" : True},
                "Red"  : { "Basket" : False, "Sliders" : True, "Moving" : True}
            },
            "CheckMarks" : {
                "Blue" : { "Auto" : "Blank", "Basket" : False, "Moving" : False, "Slider1" : False, "Slider2" : False, "Slider3" : False},
                "Red" :  { "Auto" : "Blank", "Basket" : False, "Moving" : False, "Slider1" : False, "Slider2" : False, "Slider3" : False}
            },
            "BlueWinBanner" : True,
            "RedWinBanner" : True,
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
            "RedTeamName" : "red",
            "BlueScore" : 500,
            "RedScore" : 500 }
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
        tout = json.dumps(self.game_state) 
        return tout

    def set_checks(self, auto, basket, moving, slider1, slider2, slider3):
        x = {"Auto" : auto, "Basket" : basket, "Moving" : moving, "Slider1" : slider1,
             "Slider2" : slider2, "Slider3" : slider3}
        return x 

    def send_test_board(self):
        # Generates a test pattern for the score board to
        # make sure no features are broken when changing css/js/html.
        t = int(time.monotonic() - self.t0)
        self.game_state["GameTimeToGo"] = t
        bigcycle = (int(self.update_count / 10)) % 10
        #bigcycle should count to 9 and reset, one count per second.
        if bigcycle == 0:
            self.game_state["GameMode"] == "Standby"
            self.game_state["TimerLabel"] = " "
            self.game_state["Timer"] = "--"
            self.game_state["BlueTeamName"] = "Solders"
            self.game_state["RedTeamName"] = "Seniors"
            self.game_state["GameElement"]["Red"]["Basket"] = True
            self.game_state["GameElement"]["Red"]["Sliders"] = True
            self.game_state["GameElement"]["Red"]["Moving"] = True
            self.game_state["GameElement"]["Blue"]["Basket"] = True
            self.game_state["GameElement"]["Blue"]["Sliders"] = True
            self.game_state["GameElement"]["Blue"]["Moving"] = True
            self.game_state["CheckMarks"]["Blue"] = self.set_checks("Blank", False, False, False, False, False)
            self.game_state["CheckMarks"]["Red"] = self.set_checks("Blank", False, False, False, False, False)

        if bigcycle == 1:
            self.game_state["GameMode"] ="Count Down!!"
            self.game_state["TimerLabel"] = "Count Down"
            self.game_state["Timer"] = "9"
        if bigcycle > 1:
            self.game_state["Timer"] = str(int(self.game_state["Timer"]) - 1)
        if bigcycle == 2:
            self.game_state["GameMode"] = "Count Down!!!"     
        if bigcycle == 3:
            self.game_state["GameMode"] = "GAME ON!"
            self.game_state["TimerLabel"] = "Auto"
            self.game_state["GameElement"]["Red"]["Basket"] = False
            self.game_state["GameElement"]["Blue"]["Sliders"] = False
            self.game_state["CheckMarks"]["Blue"] = self.set_checks("Checked", False, True, False, False, True)
            self.game_state["CheckMarks"]["Red"] = self.set_checks("Failed", False, False, True, True, False)
        if bigcycle == 5:
            self.game_state["BlueTeamName"] = "Cowboys"
            self.game_state["RedTeamName"] = "Lawyers"
            self.game_state["GameMode"] = "GAME ON!"
            self.game_state["TimerLabel"] = "TeleOp"
            self.game_state["GameElement"]["Red"]["Moving"] = False
            self.game_state["GameElement"]["Blue"]["Moving"] = False
        if bigcycle == 7:
            self.game_state["GameMode"] = "Error"
            self.game_state["CheckMarks"]["Blue"] = self.set_checks("Failed", True, True, True, True, False)
            self.game_state["CheckMarks"]["Red"] = self.set_checks("Checked", True, True, True, True, True)
        if bigcycle == 8:
            self.game_state["GameMode"] = "PostGame"
            self.game_state["TimerLabel"] = "Finished"
            self.game_state["GameElement"]["Red"]["Sliders"] = False
            self.game_state["GameElement"]["Blue"]["Basket"] = False
        self.game_state["BlueScore"] = 100 - bigcycle
        self.game_state["RedScore"] = 20 + bigcycle
 
        nstate = (int(self.update_count / 20)) % 4 
        # nstate should change once every 2 secs
        if nstate == 0:
            self.game_state["BlueWinBanner"] = False
            self.game_state["RedWinBanner"]  = False
        if nstate == 1:
            self.game_state["BlueWinBanner"] = True
            self.game_state["RedWinBanner"]  = False
        if nstate == 2:
            self.game_state["BlueWinBanner"] = False
            self.game_state["RedWinBanner"]  = True
        if nstate == 3:
            self.game_state["BlueWinBanner"] = True
            self.game_state["RedWinBanner"]  = True



if __name__ == "__main__":
   sm = ScoreManager()
   sm.update()
   t = sm.get_state()
   print("Json: ", t)  
