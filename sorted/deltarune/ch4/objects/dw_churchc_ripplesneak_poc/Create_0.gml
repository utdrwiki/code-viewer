con = 0;
timer = 0;
init = 0;
siner = 0;
layer_set_visible("DEBUG_ASSETS", 0);
if (scr_debug())
{
    if (keyboard_check(ord("P")))
    {
    }
}
darkness = instance_create(x, y, obj_darkness_overlay);
darkness.castShadow = false;
bg = instance_create(x, y, obj_dw_church_darkroombg);
nextlight = -4;
lightsequence = 0;
