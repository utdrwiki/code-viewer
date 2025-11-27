if (i_ex(obj_round_evaluation))
    exit;
if (canceltimer == canceltime)
{
    canceltimer++;
    snd_play(snd_closet_impact);
    if (room == room_dw_rhythm)
    {
        with (obj_rhythmgame)
        {
            replayquit = 1;
            if (lose_con == 0)
                lose_con = 1;
        }
    }
    else
    {
        inst = instance_create_depth(x, y, -99999, obj_gameover_minigame);
        inst.replayversion = true;
        inst.quitversion = true;
        if (room == room_dw_chef)
        {
            scr_chefs_end();
            global.flag[7] = 0;
        }
        if (room == room_dw_susiezilla)
        {
            with (obj_susiezilla_gamecontroller)
            {
                mode = -1;
                susiezilla_destroy();
            }
            with (obj_ch3_tennashouter)
                instance_destroy();
            with (obj_ch3_tennashouter_alt)
                instance_destroy();
        }
    }
    instance_destroy();
}
