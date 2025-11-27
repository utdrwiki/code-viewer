image_alpha = 0;
active = false;
init = 0;
con = 0;
timer = 0;
kris = 0;
kr_real = 0;
transitionmarker = 0;
if (scr_debug())
{
    if (keyboard_check(ord("H")))
        global.swordboardeath = 1;
}
kind = 0;
if (global.swordboardeath == 1)
    kind = 1;
if (kind == 0)
{
    global.flag[1055] = 1.5;
    global.flag[7] = 1;
    if (global.flag[1087] == 1)
    {
        transitionmarker = scr_board_marker(x - 32, y - 64, spr_pxwhite);
        with (transitionmarker)
        {
            image_xscale = 384;
            image_yscale = 32;
            image_blend = c_black;
            depth = -5;
        }
        transition = instance_create(x - 32, y - 32, obj_board_squaretransition);
        transition.depth = 100001;
        transition.special = "heart";
        obj_gameshow_swordroute.screencolor = c_black;
    }
    scon = 0;
    cskip = 0;
}
if (kind == 1)
{
    con = 49.6;
    timer = 0;
}
