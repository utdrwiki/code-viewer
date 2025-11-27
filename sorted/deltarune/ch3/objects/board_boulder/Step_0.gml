scr_depth_board();
memfriction = friction;
if (con == 0)
{
    waittime = 20 + irandom_range(-4, 4);
    timer = 0;
    cury = y;
    con = 1;
}
if (place_meeting(x, y, obj_board_grayregion))
    instance_destroy();
if (con == 1)
{
    if (y > (cury + 60))
    {
        vspeed = -6 + random(2);
        snd_stop(snd_bump);
        snd_play_x(snd_bump, 0.5, 0.8);
        con = 0;
    }
}
if (y > 400)
    instance_destroy();
if (obj_board_camera.con == 0)
    x = clamp(x, 160, 448);
