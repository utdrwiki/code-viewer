layer_set_visible("debug_assets", 0);
if (scr_debug())
{
    scr_setparty(1, 1);
    if (keyboard_check(ord("P")))
    {
        global.flag[886] = 0;
        global.flag[891] = 0;
    }
}
con = 0;
timer = 0;
prophecyactive = 0;
proptrig = 0;
prophecy = instance_create(578, 240, obj_dw_church_prophecy);
prophecy.extflag = "rightpiece";
roomglow = instance_create(0, 0, obj_roomglow);
if (global.flag[886] == 1 || global.flag[886] == -1)
{
    proptrig = 1;
    con = -999;
}
