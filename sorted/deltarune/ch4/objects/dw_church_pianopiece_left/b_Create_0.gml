layer_set_visible("debug_assets", 0);
global.flag[7] = 0;
con = 0;
timer = 0;
if (scr_debug())
{
    scr_setparty(1, 1);
    if (keyboard_check(ord("P")))
    {
        global.tempflag[56] = 1;
        con = 1;
        global.tempflag[50] = 1602;
        global.tempflag[51] = 291;
        global.tempflag[52] = 1596;
        global.tempflag[53] = 383;
        global.tempflag[54] = 1600;
        global.tempflag[55] = 495;
        global.tempflag[56] = 1;
        global.flag[886] = 0;
        global.flag[891] = 0;
    }
}
if (global.tempflag[56] == 1)
    con = 1;
var gimmefakevals = 0;
if (gimmefakevals == 1)
{
    global.tempflag[50] = 1602;
    global.tempflag[51] = 291;
    global.tempflag[52] = 1596;
    global.tempflag[53] = 383;
    global.tempflag[54] = 1600;
    global.tempflag[55] = 495;
    global.tempflag[56] = 1;
}
if (gimmefakevals == 2)
{
    global.tempflag[50] = 1600;
    global.tempflag[51] = 292;
    global.tempflag[52] = 1594;
    global.tempflag[53] = 324;
    global.tempflag[54] = 1598;
    global.tempflag[55] = 376;
    global.tempflag[56] = 1;
}
proptrig = 0;
prophecyactive = 0;
if (global.tempflag[56] != 1)
    proptrig = 1;
prophecy = instance_create(578, 240, obj_dw_church_prophecy);
prophecy.extflag = "leftpiece";
roomglow = instance_create(0, 0, obj_roomglow);
if (global.flag[891] == 1 || global.flag[891] == -1)
{
    con = -1;
    proptrig = 1;
}
if (scr_debug())
    scr_setparty(1, 1);
