# score_tbl.py -- Keeps the score in a object
# dlb, Nov 2021

auto_mult = 2
tele_mult = 1
endgame_mult = 1
basket_mult = 4
mover_mult = 10
slider_mult = 1
auto_run = 40

class ScoreTbl():
  def __init__(self, side):
    self.side = side
    self.clear()

  def clear(self):
    self.autorun = False
    self.auto = [0, 0, 0]
    self.tele = [0, 0, 0]
    self.endgame = [0, 0, 0]
    self.rake = 0
    self.adj = 0

  def set_autorun(okay):
    if okay: self.autorun = True
    else: self.autorun = False

  def set_auto(self, basket, slider, mover):
    self.auto[0], self.auto[1], self.auto[2] = basket, slider, mover
  
  def set_tele(self, basket, slider, mover):
    b, s, m = self.auto
    self.tele[0], self.tele[1], self.tele[2] = basket - b, slider - s, mover - m

  def set_endgame(self, basket, slider, mover):
    ba, sa, ma = self.auto
    bt, st, mt = self.tele
    self.endgame[0], self.endgame[1], self.auendgameto[2] = basket - (ba+bt), slider - (sa + st), mover - (ma + mt)

  def set_rake(self, rake):
    self.rake = rake 

  def set_adj(self, adj):
    self.adj = adj 

  def get_grid_item(self, unit, period):
    if unit == "basket":
      if period == "auto":
        return "%dx%d" % (self.auto[0], basket_mult * auto_mult)
      if period == "teleop":
        return "%dx%d" % (self.tele[0], basket_mult * tele_mult)
      if period == "endgame":
        return "%dx%d" % (self.endgame[2], basket_mult * endgame_mult)
      return "0x0"
    if unit == "slider":
      if period == "auto":
        return "%dx%d" % (self.auto[1], slider_mult * auto_mult)
      if period == "teleop":
        return "%dx%d" % (self.tele[1], slider_mult * tele_mult)
      if period == "endgame":
        return "%dx%d" % (self.endgame[1], slider_mult * endgame_mult)
      return "0x0"
    if unit == "mover":
      if period == "auto":
        return "%dx%d" % (self.auto[2], mover_mult * auto_mult)
      if period == "teleop":
        return "%dx%d" % (self.tele[2], mover_mult * tele_mult)
      if period == "endgame":
        return "%dx%d" % (self.endgame[2], mover_mult * endgame_mult)
      return "0x0"
    return "0x0"

  def get_grid_total(self, unit):
    if unit == "basket":
      x = self.auto[0] * auto_mult + self.tele[0] * tele_mult + self.endgame[0] * endgame_mult
      x *= basket_mult 
      return x
    if unit == "slider":
      x = self.auto[1] * auto_mult + self.tele[1] * tele_mult + self.endgame[1] * endgame_mult
      x *= slider_mult 
      return x
    if unit == "mover":
      x = self.auto[2] * auto_mult + self.tele[2] * tele_mult + self.endgame[2] * endgame_mult
      x *= mover_mult 
      return x
    return 0

  def get_score(self):
    a = 0
    if self.autorun: a = auto_run
    b = self.get_grid_total("basket") 
    s = self.get_grid_total("slider")
    m = self.get_grid_total("movers")
    return a + b + s + m + self.adj + self.rake

    

    

      self.auto[0] * auto_weight * basket_weight + self.tele[0] * tele_weight * basket_weight


  def count_hits():
    global blue_mover_hits, red_mover_hits, blue_slider_hits, red_slider_hits
    global blue_basket_hits, red_basket_hits
    global blue_score, red_score
    bmh, rmh, bsh, rsh, bbh, rbh = 0, 0, 0, 0, 0, 0
    ua = game_config["unitassignments"]
    for uname in ua.keys():
        unittype, snum = uname.split("-")
        num = int(snum) - 1 
        if unittype == "mover":
            n = target_manager.get_hits(unittype+"s", num)
            if ua[uname] == "red": rmh += n
            if ua[uname] == "blue": bmh += n 
        if unittype == "slider":
            n = target_manager.get_hits(unittype+"s", num)
            if ua[uname] == "red": rsh += n
            if ua[uname] == "blue": bsh += n   
        if unittype == "basket":
            n = target_manager.get_hits(unittype+"s", num)
            if ua[uname] == "red": rbh += n
            if ua[uname] == "blue": bbh += n
    red_auto_score = 0
    blue_auto_score = 0 
    if red_auto == "pass": red_auto_score = 40
    if blue_auto == "pass": blue_auto_score = 40
    blue_score = blue_auto_score + bmh * 10 + bbh*4 + bsh
    red_score = red_auto_score + rmh * 10 +  rbh*4 + rsh 
    blue_mover_hits = bmh 
    blue_slider_hits = bsh
    red_mover_hits = rmh 
    red_slider_hits = rsh 
    blue_basket_hits = bbh
    red_basket_hits = rbh
    return

