#ifndef NEO_CONDUCTOR_H
#define NEO_CONDUCTOR_H

class NeoConductor {
 public:
  NeoConductor(int16_t neopin1=-1, int16_t neopin2=-1);
  void begin(void);
 private:
    int16_t _neopin1;
    int16_t _neopin2;
};

#endif