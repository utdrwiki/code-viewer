image_alpha = 0;
active = false;
init = 0;
con = 0;
timer = 0;
kris = 0;
depth = 0;
markerbar = 0;
if (scr_debug())
{
}
transition = 0;
if (room == room_board_preshadowmantle_repeat)
    global.tempflag[52] = 1;
if (global.tempflag[52] == 1)
{
    global.tempflag[52] = 0;
    transition = instance_create(x, y, obj_board_squaretransition);
    transition.depth = 100001;
    transition.special = "heart";
    obj_gameshow_swordroute.screencolor = c_black;
}
else
{
    con = 10;
}
if (room == room_board_dungeon_3)
{
    if (global.swordboardeath == 1)
    {
        with (transition)
            instance_destroy();
        con = 420;
        timer = 0;
    }
}
scon = 0;
cskip = 0;
kpause = 0;
ktimer = 0;
