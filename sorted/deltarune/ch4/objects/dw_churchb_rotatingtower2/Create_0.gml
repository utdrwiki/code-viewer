timer = 0;
con = 0;
layer_set_visible("TILES_SLIDES", 0);
layer_set_visible("DEBUG_ASSETS", 0);
ialpha = 0;
var lay_id = layer_get_id("BGCOLOR");
back_id = layer_background_get_id(lay_id);
if (scr_debug())
{
    scr_setparty(1);
    if (global.flag[23] != 1)
    {
        global.flag[23] = 1;
        debug_print("Climb Flag [23] enabled");
    }
    if (keyboard_check(ord("W")))
    {
        if (keyboard_check_pressed(ord("V")))
        {
        }
    }
}
