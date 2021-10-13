#ifndef NEO_CONDUCTOR_H
#define NEO_CONDUCTOR_H

class NeoConductor {
 public:
  NeoConductor(int neopin1, int neopin2);
  void begin(void);
  void update(void);
  void setmode(int mode);
 private:
    int _neopin1;
    int _neopin2;
    int _npixels1;
    int _npixels2;
};

#endif