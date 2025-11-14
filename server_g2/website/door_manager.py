# door_manager.py -- manages the slider doors during the running of the game
# dlb, Nov 2025
# New For SideQuest

from fmslogger import log

schedules = [
  {
    "name": "Schedule 1",
    "doors": {
      "Door 0": [[0, 15], [30, 42], [50, 60]],
      "Door 1": [[0, 18], [24, 36], [44, 60]],
      "Door 2": [[6, 24], [32, 48]],
      "Door 3": [[0, 12], [20, 34], [40, 56]],
      "Door 4": [[10, 30], [30, 46]],
      "Door 5": [[14, 26], [38, 60]]
    }
  },
  {
    "name": "Schedule 2",
    "doors": {
      "Door 0": [[0, 14], [26, 40], [48, 60]],
      "Door 1": [[0, 10], [18, 34], [42, 60]],
      "Door 2": [[6, 22], [28, 44]],
      "Door 3": [[0, 12], [20, 36], [52, 60]],
      "Door 4": [[8, 24], [32, 50]],
      "Door 5": [[12, 30], [38, 58]]
    }
  },
  {
    "name": "Schedule 3",
    "doors": {
      "Door 0": [[0, 16], [24, 38]],
      "Door 1": [[0, 12], [22, 40], [48, 60]],
      "Door 2": [[4, 20], [32, 60]],
      "Door 3": [[0, 10], [18, 34], [42, 58]],
      "Door 4": [[8, 28], [30, 46]],
      "Door 5": [[14, 26], [36, 60]]
    }
  }
]

class DoorManager():
    def __init__(self):
        self.schedule_num = 0
        self.previous_secs = 0
        self.previous_doors = [0, 0, 0, 0, 0, 0]

    def set_schedule_num(self, i):
        if i < 0 or i > 2: i = 0
        self.schedule_num = i

    def get_doors(self, isecs):
        # Returns a list of door conditions at the given time
        sched = schedules[self.schedule_num]
        doors = []
        for i in range(6):
            tms = sched["doors"]["Door " + str(i)]
            v = False
            for tt in tms:
                if isecs >= tt[0] and isecs <= tt[1]: v = True 
            doors.append(v)
        return doors
     


