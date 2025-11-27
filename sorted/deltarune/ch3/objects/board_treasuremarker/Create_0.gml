depth = 999990;
image_speed = 0;
animateonce = false;
autodepth = false;
digamt = 1;
skip = false;
if ((holeid == 2 && global.flag[1040] > 0) || (holeid == 3 && global.flag[1040] > 1) || (holeid == 1 && global.flag[1040] > 2))
{
    skip = true;
    event_user(2);
}
if (room == room_dw_b3bs_rouxls_lanina)
{
    if (global.flag[1169] == 1)
    {
        scr_board_marker(x, y, spr_board_holemarker, 0, depth, 2);
        instance_destroy();
    }
}
camkill = false;
