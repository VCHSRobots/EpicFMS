# score_table.py -- Keeps the total score in a object
# dlb, Nov 2021

# This module/class is where we actually calcualte the score based on
# various conditions and weighting factors

# These constants define the weighting factors used to calculate the score
auto_mult = 2        # Weight for scoring in auto
tele_mult = 1        # Weight for scoring in teleop
endgame_mult = 1     # Weight for scoring in endgame
basket_mult = 4      # Number of points per basket shot
mover_mult = 10      # Number of points per mover shot
slider_mult = 1      # Number of points per slider shot 
auto_run = 40        # Number of points for completing the auto run path
two_slider_mult = 2    # Weight for scoring on two slider units
three_slider_mult = 3  # Weight for scoring on three slider units

class ScoreTable():
  def __init__(self):
    self.clear()

  def clear(self):
    # Resets the score/hit counts to zero to start a new game.
    self.autorun = False
    self.autoreport = False
    self.auto = [0, 0, 0, 0, 0]  # format is: basket, slider1, slider2, slider3, mover
    self.teleop = [0, 0, 0, 0, 0]
    self.endgame = [0, 0, 0, 0, 0]
    self.rake = 0
    self.adj = 0

  def set_autorun(self, okay):
    # Sets the outcome of auto run.  True means the robot
    # followed the correct path.
    self.autoreport = True
    if okay: self.autorun = True
    else: self.autorun = False

  def reset_autorun(self):
    # Resets autorun to an "unreported" status.
    self.autorun = False
    self.autoreport = False

  def set_auto(self, basket, slider1, slider2, slider3, mover):
    # Sets the hits during auto.  Can be called repeatedly and
    # at any time curing the game.
    self.auto[0] = basket 
    self.auto[1], self.auto[2], self.auto[3] = slider1, slider2, slider3 
    self.auto[4] = mover

  def set_teleop(self, basket, slider1, slider2, slider3, mover):
    # Sets the hits during teleop.  Can be called repeatedly and
    # at any time curing the game.  The inputs should be the total
    # hits from the beginning of the game, including auto hits.
    self.teleop[0] = basket - self.auto[0]
    self.teleop[1] = slider1 - self.auto[1] 
    self.teleop[2] = slider2 - self.auto[2]
    self.teleop[3] = slider3 - self.auto[3]
    self.teleop[4] = mover - self.auto[4]

  def set_endgame(self, basket, slider1, slider2, slider3, mover):
    # Sets the hits during endgame.  Can be called repeatedly and
    # at any time curing the game.  The inputs should be the total
    # hits from the beginning of the game, including auto and teleop hits.
    self.endgame[0] = basket - self.auto[0] - self.teleop[0]
    self.endgame[1] = slider1 - self.auto[1] - self.teleop[1]
    self.endgame[2] = slider2 - self.auto[2] - self.teleop[2]
    self.endgame[3] = slider3 - self.auto[3] - self.teleop[3]
    self.endgame[4] = mover - self.auto[4] - self.teleop[4]

  def set_postgame(self, basket):
    # Sets the final hits on the basket during postgame count.
    self.endgame[0] = basket - self.auto[0] - self.teleop[0] 

  def set_rake(self, rake):
    # Sets the hits for raking. Can be called anytime.
    self.rake = rake 

  def get_rake(self):
    # Returns the value used for raking.
    return self.rake

  def set_adj(self, adj):
    # Sets an adjustment value. Can be called anytime
    self.adj = adj 

  def get_adj(self):
    # Returns the adjustement value.
    return self.adj

  def get_slider_mult(self):
    # Returns the multiplyer for the number of different sliders hit
    slider1 = self.auto[1] + self.teleop[1] + self.endgame[1] 
    slider2 = self.auto[2] + self.teleop[2] + self.endgame[2]
    slider3 = self.auto[3] + self.teleop[3] + self.endgame[3]
    nsliders = 0 
    if slider1 > 0: nsliders += 1 
    if slider2 > 0: nsliders += 1 
    if slider3 > 0: nsliders += 1 
    if nsliders >= 3: return  three_slider_mult
    if nsliders >= 2: return two_slider_mult 
    return 1
 
  def get_grid_item(self, unit, period):
    # Returns a string in the form of "0x0" to indicate the hits for
    # the target and the period of the game.  The first digit indicates
    # the actual count of balls, and the second is the multipler being
    # applied.
    if unit == "basket":
      if period == "auto":
        return "%dx%d" % (self.auto[0], basket_mult * auto_mult)
      if period == "teleop":
        return "%dx%d" % (self.teleop[0], basket_mult * tele_mult)
      if period == "endgame":
        return "%dx%d" % (self.endgame[0], basket_mult * endgame_mult)
      return "0x0"
    if unit == "slider":
      sm = self.get_slider_mult()
      if period == "auto":
        hits = self.auto[1] + self.auto[2] + self.auto[3] 
        return "%dx%d" % (hits, slider_mult * auto_mult * sm)
      if period == "teleop":
        hits = self.teleop[1] + self.teleop[2] + self.teleop[3]
        return "%dx%d" % (hits, slider_mult * tele_mult * sm)
      if period == "endgame":
        hits = self.endgame[1] + self.endgame[2] + self.endgame[3]
        return "%dx%d" % (hits, slider_mult * endgame_mult * sm)
      return "0x0"
    if unit == "mover":
      if period == "auto":
        return "%dx%d" % (self.auto[4], mover_mult * auto_mult)
      if period == "teleop":
        return "%dx%d" % (self.teleop[4], mover_mult * tele_mult)
      if period == "endgame":
        return "%dx%d" % (self.endgame[4], mover_mult * endgame_mult)
      return "0x0"
    return "0x0"

  def get_grid_total(self, unit):
    # Returns an integer for the total score for the unit type
    if unit == "basket":
      x = self.auto[0] * auto_mult + self.teleop[0] * tele_mult + self.endgame[0] * endgame_mult
      x *= basket_mult 
      return x
    if unit == "slider":
      sm = self.get_slider_mult()
      x1 = (self.auto[1] + self.auto[2] + self.auto[3]) * auto_mult * slider_mult * sm
      x2 = (self.teleop[1] + self.teleop[2] + self.teleop[3]) * tele_mult * slider_mult * sm
      x3 = (self.endgame[1] + self.endgame[2] + self.endgame[3]) * endgame_mult * slider_mult * sm
      return x1 + x2 + x3
    if unit == "mover":
      x = self.auto[4] * auto_mult + self.teleop[4] * tele_mult + self.endgame[4] * endgame_mult
      x *= mover_mult 
      return x
    return 0

  def get_auto_score(self):
    # Returns the values for the auto-run display: (showit, pass_cb, fail_cb, score)
    pass_cb, fail_cb = False, False
    score = 0 
    if self.autoreport:
      if self.autorun: 
        pass_cb = True
        score = auto_run 
      else:
        fail_cb = True 
    return self.autoreport, pass_cb, fail_cb, score

  def get_basket_checkmark(self):
    # Returns true if checkmark should be placed next to basket target
    return (self.auto[0] + self.teleop[0] + self.endgame[0]) > 0

  def get_slider_checkmarks(self):
    # Returns array of bools if checkmark should be place next to each slider
    c1 = (self.auto[1] + self.teleop[1] + self.endgame[1]) > 0
    c2 = (self.auto[2] + self.teleop[2] + self.endgame[2]) > 0
    c3 = (self.auto[3] + self.teleop[3] + self.endgame[3]) > 0
    return c1, c2, c3

  def get_mover_checkmark(self):
    # Retruns true if checkmark should be places next to mover target
    return (self.auto[4] + self.teleop[4] + self.endgame[4]) > 0

  def get_score(self):
    # Returns the total score
    a = 0
    if self.autorun: a = auto_run
    b = self.get_grid_total("basket") 
    s = self.get_grid_total("slider")
    m = self.get_grid_total("mover")
    return a + b + s + m + self.adj + self.rake
