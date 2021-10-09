// neo_conductor.cpp -- A class to manage two strips of Neo Pixels
// for the EpicFMS devices
// dlb, Oct 2021
//

#include "EpicFmsLib.h"

NeoConductor::NeoConductor(int16_t neopin1=-1, int16_t neopin2=-1) {
    _neopin1 = neopin1;
    _neopin2 = neopin2;
}

void NeoConductor::begin(void) {

}