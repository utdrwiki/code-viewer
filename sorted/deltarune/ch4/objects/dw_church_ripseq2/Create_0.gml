con = 0;
timer = 0;
init = 0;
siner = 0;
chaser = 0;
layer_set_visible("DEBUG_ASSETS", 0);
if (scr_debug())
{
    scr_setparty(1, 1);
    if (keyboard_check(ord("P")))
        global.tempflag[90] = 10;
}
ripplemanager = instance_create(x, y, obj_church_ripple_area_manager);
ripplemanager.alwaysrip = true;
for (var i = 0; i < 4; i++)
    global.hp[i] = global.maxhp[i];
subcon = 0;
