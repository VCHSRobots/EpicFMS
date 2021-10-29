// neo_basket.h -- sub class for managing neo strip on basket target
// dlb, Oct 2021

#ifndef NEO_BASKET_H
#define NEO_BASKET_H

#include "neo_base.h"

// This structure is used for the basket target.
typedef struct neo_basket_params {
    int game_mode;
    bool online;
    bool hiterror;
    bool stuck;
    bool jerking;
    long hitcount;
    long jamcount;
    float revs;
} Neo_Basket_Params;

class NeoBasket : public NeoBase {
 public:
    NeoBasket(int neopin1, int neopin2, int npixels1, int npixels2);
    void set_params(Neo_Basket_Params *p);
    void smash(int gamemode, bool changed, uint32_t telp);
    void show_hit(void);

 protected:
    Neo_Basket_Params _params;
    bool _newparams;
    bool params_equal(Neo_Basket_Params *p1, Neo_Basket_Params *p2);  
};

#endif