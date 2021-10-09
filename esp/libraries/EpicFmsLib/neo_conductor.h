#ifndef NEO_CONDUCTOR_H
#define NEO_CONDUCTOR_H

class NeoConductor {
 public:
  NeoConductor(int neopin1, int neopin2);
  void begin(void);
 private:
    int _neopin1;
    int _neopin2;
};

#endif