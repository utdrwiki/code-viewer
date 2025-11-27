if (con == 0)
{
    timer = 0;
    if (obj_board_camera.con == 0)
    {
        if (place_meeting(x, y, obj_mainchara_board))
        {
            global.interact = 1;
            con = 1;
            timer = 0;
        }
    }
}
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        transition = instance_create(x, y, obj_board_transition);
        with (transition)
            transitionspeed = 5;
        snd_play_pitch(snd_board_escaped, 0.8);
    }
    if (i_ex(transition))
    {
        if (transition.con == 3)
        {
            with (obj_board_camera)
            {
                global.interact = 1;
                shift = "warp";
                warpx = 2048;
                warpy = 320;
                playerX = 2224;
                playerY = 512;
                instawarp = true;
            }
            with (obj_mainchara_board)
                facing = 2;
        }
    }
    if (timer > 2 && !i_ex(obj_board_transition))
    {
        timer = 0;
        con = 0;
        global.interact = 0;
    }
}
