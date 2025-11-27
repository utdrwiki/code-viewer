con = 0;
timer = 0;
init = 0;
siner = 0;
makeslide = false;
layer_set_visible("DEBUG_ASSETS", 0);
if (scr_debug())
{
    if (keyboard_check(ord("P")))
    {
    }
}
if (global.flag[850] >= 5 || global.flag[23] == true)
    makeslide = true;
