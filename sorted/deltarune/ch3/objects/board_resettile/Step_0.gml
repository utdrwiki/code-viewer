var _controlledPlayer = 0;
with (obj_mainchara_board)
{
    if (controlled == true)
        _controlledPlayer = id;
}
resetcounttimer--;
if (pressed == 0)
{
    if (i_ex(instance_place(x, y, _controlledPlayer)))
    {
        pressed = true;
        snd_stop(snd_bell);
        snd_play(snd_bell);
        pt = 1;
        if (resetcounttimer <= 0)
        {
            resetcount++;
            resetcounttimer = 150;
        }
        reset = true;
        with (obj_board_event_bridgepuzzle)
        {
            if (puzzleid == other.puzzleid)
            {
                reset = true;
                resetcount = other.resetcount;
                other.reset = false;
            }
        }
        if (room == room_dw_b3bs_mysterypuzzle)
        {
            with (obj_dw_b3bs_mysterypuzzle)
                resettile = true;
        }
    }
}
if (pressed == 1)
{
    if (!i_ex(instance_place(x, y, _controlledPlayer)))
    {
        pressed = false;
        pt = 0;
    }
}
image_index = pressed;
