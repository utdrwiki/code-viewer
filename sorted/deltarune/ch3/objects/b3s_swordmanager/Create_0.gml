image_alpha = 0;
active = false;
init = 0;
con = 0;
timer = 0;
kris = 0;
depth = 0;
if (scr_debug())
{
    if (keyboard_check(ord("H")))
        global.swordboardeath = 1;
}
if (global.flag[1007] == 0 && global.swordboardeath == 0)
{
    transition = instance_create(x, y, obj_board_squaretransition);
    transition.depth = 100001;
    transition.special = "heart";
    obj_gameshow_swordroute.screencolor = c_black;
}
else
{
    con = 10;
}
scon = 0;
cskip = 0;
susie = 0;
ralsei = 0;
kpause = 0;
ktimer = 0;
