if (init == 0)
{
    scoreleft = scoreamount;
    mysign = sign(scoreamount);
    init = 1;
    if (mysign < 0)
    {
        if (i_ex(obj_board_scoreboard))
        {
            with (obj_board_scoreboard)
                image_blend = #E33D47;
            scr_shakeobj(554);
        }
    }
    if (modamt == 5)
    {
        if (abs(scoreamount) >= 100)
            modamt = 10;
        if (abs(scoreamount) >= 1000)
            modamt = 100;
    }
}
if (init == 1)
{
    timer++;
    if (scoreleft != 0)
    {
        if (scoreleft > 0)
            snd_play_pitch(mysnd, 1);
        if (scoreleft < 0)
            snd_play_pitch(mysnd, 0.8);
        if (mysign > 0)
        {
            if (scoreleft > modamt)
            {
                scoreleft -= modamt;
                global.flag[1044] += modamt;
                global.flag[1117] += modamt;
            }
            else
            {
                global.flag[1044] += scoreleft;
                global.flag[1117] += scoreleft;
                scoreleft = 0;
            }
        }
        if (mysign < 0)
        {
            if (scoreleft < -modamt)
            {
                scoreleft += modamt;
                global.flag[1044] -= modamt;
                global.flag[1117] -= modamt;
            }
            else
            {
                global.flag[1044] += scoreleft;
                global.flag[1117] += scoreleft;
                scoreleft = 0;
            }
        }
    }
    else
    {
        with (obj_board_scoreboard)
            image_blend = c_white;
        instance_destroy();
    }
}
