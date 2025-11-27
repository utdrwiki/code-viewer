init = 0;
con = 0;
timer = 0;
makedark = true;
if (scr_debug())
{
    if (keyboard_check(ord("P")))
    {
        global.plot = 108;
        global.flag[869] = 0;
    }
    if (global.plot < 108)
    {
        global.plot = 108;
        scr_setparty(1, 0, 0);
    }
    if (global.plot >= 120)
        scr_setparty(1, 1, 0);
}
steelcage = instance_create(1200, 120, obj_dw_church_steelstaff);
if (global.flag[869] == 1)
{
    makedark = false;
    steelcage.flyaway = false;
    safe_delete(steelcage);
    with (obj_church_piano_playable)
        solved = 1;
    con = 1;
    with (obj_church_piano_hint)
        instance_destroy();
    with (obj_floorswitch)
        instance_destroy();
    with (obj_church_triggerlight)
        instance_destroy();
}
scr_musicer("darkchurch_intro.ogg", 0.7);
init = 0;
