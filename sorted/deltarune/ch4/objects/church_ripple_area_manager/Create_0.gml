active = true;
stepped = false;
init = 0;
kris = 0;
ralsei = 0;
susie = 0;
sustep = 0;
rastep = 0;
stepped[0] = 0;
stepped[1] = 0;
stepped[2] = 0;
if (layer_exists("DEBUG_BGCOLOR"))
    layer_set_visible("DEBUG_BGCOLOR", 0);
if (layer_exists("DEBUG_BGCOLOR"))
    layer_set_visible("DEBUG_BGCOLOR", 0);
if (layer_exists("FLOORTILES"))
    layer_set_visible("FLOORTILES", 1);
alwaysrip = false;
lightcon = -1;
global.flag[31] = 1;
makefirstrip = true;
if (up_h() || down_h() || right_h() || left_h())
    makefirstrip = false;
