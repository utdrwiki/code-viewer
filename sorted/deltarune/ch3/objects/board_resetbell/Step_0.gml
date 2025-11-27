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
        if (resetcounttimer <= 0)
        {
            resetcount++;
            resetcounttimer = 150;
        }
        reset = true;
    }
}
if (pressed == 1)
{
    if (!i_ex(instance_place(x, y, _controlledPlayer)))
        pressed = false;
}
