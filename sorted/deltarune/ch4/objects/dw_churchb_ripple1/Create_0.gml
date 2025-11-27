timer = 0;
con = 0;
layer_set_visible("DEBUG_BGCOLOR", 0);
layer_set_visible("WALLTILES", 0);
layer_set_visible("FLOORTILES", 1);
if (scr_debug())
{
    if (keyboard_check(ord("W")))
    {
        if (keyboard_check_pressed(ord("V")))
        {
        }
    }
}
rippleareamanager = instance_create(0, 0, obj_church_ripple_area_manager);
rippleareamanager.alwaysrip = true;
makerip = false;
makerip2 = false;
makerip3 = false;
instance_create(x, y, obj_dw_church_fog);
window = [];
windinit = 0;
ripindex = 0;
ripcount = 0;
