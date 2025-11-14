# score_table.py -- Keeps the total score in a object
# dlb, Nov 2021
# Updated for SideQuest, Nov 2025

# This module/class is where we actually calcualte the score based on
# various conditions and weighting factors

import copy

class ScoreTable():
  def __init__(self):
    self.clear()

  def clear(self):
    # Resets the score/hit counts to zero to start a new game.
    # Note: the table is set in a disabled mode.
    self.hits = [0, 0, 0, 0, 0, 0]
    self.links = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    self.score = 0
    self.nhits = 0
    self.nlinks = 0
    self.enable = False
    return self.score

  def set_enable(self, e):
    # Enables (or disables) the table from accepting new hits
    self.enable = e

  def set_hits(self, s1, s2, s3, s4, s5, s6): 
    # Sets the hits for the given target, then
    # recalculates the score.
    if not self.enable: return
    s = (s1, s2, s3, s4, s5, s6)
    for i in range(6):
      v = s[i]
      if v > self.hits[i]: self.hits[i] = v
    self.cal_links()
    self.cal_score()
    return self.score

  def cal_links(self):
    # Calculates the links 
    ilink = 0
    for ty in range(6):
      for tx in range(6):
        if ty >= tx: continue 
        n = self.hits[tx] 
        n1 = self.hits[ty]
        if n1 < n: n = n1 
        self.links[ilink] = n
        ilink += 1

  def cal_score(self):
    # Calclues the final score
    nhits = 0
    nlinks = 0
    for n in self.hits: nhits += n
    for n in self.links: nlinks += n
    self.nhits = nhits
    self.nlinks = nlinks
    self.score = 10 * (nhits + nlinks)

  def get_total_score(self):
    # Returns the current score from stored data.
    return self.score
  
  def get_link_table(self):
    # Returns the link table
    return copy.deepcopy(self.links)
  
  def get_hit_table(self):
    return copy.deepcopy(self.hits)
  
  def get_links(self):
    return self.nlinks
  
  def get_hits(self):
    return self.nhits
  
  














