init = 0;
if (reward < 0)
    sprite_index = spr_board_tile_losepoints;
init = 1;
if (tilecon == 0)
    timer = 0;
if (tilecon == 1 && obj_mainchara_board.movingnow == 0)
{
    if (i_ex(obj_board_controller))
        obj_board_controller.phase = 99;
    timer++;
    if (timer == 5)
    {
        rewardadded = 0;
        tilecon = 2;
    }
}
if (tilecon == 2)
{
    if (reward > 0)
    {
        if (rewardadded < reward)
        {
            global.flag[1044] += 2;
            global.flag[1117] = 2;
            rewardadded += 2;
            if ((rewardadded % 4) == 0)
                snd_play(snd_txtsans);
        }
        else
        {
            tilecon = 99;
        }
    }
    else if (rewardadded < abs(reward))
    {
        global.flag[1044] -= 2;
        if (global.flag[1044] < 0)
        {
            global.flag[1044] = 0;
            rewardadded = 99999;
        }
        rewardadded += 2;
        if ((rewardadded % 4) == 0)
            snd_play(snd_txtpap);
    }
    else
    {
        tilecon = 99;
    }
}
if (tilecon == 99)
{
    tilecon = 0;
    tiledone = 1;
    if (i_ex(obj_board_controller))
        obj_board_controller.phase = 0;
    instance_destroy();
}
