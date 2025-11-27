if (con == 0)
{
    timer = 0;
    if (obj_board_camera.con == 0)
    {
        if (place_meeting(x, y, obj_mainchara_board))
        {
            snd_play(snd_board_escaped);
            global.interact = 1;
            scr_quickwarp(3200, 64, 3376, 256);
            con = 1;
            timer = 0;
        }
    }
}
if (con == 1)
{
    if (obj_board_camera.con == 0)
        con = 0;
}
