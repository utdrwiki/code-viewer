function snd_play_delay(arg0, arg1, arg2 = 1, arg3 = 1)
{
    return scr_script_delayed(snd_play_x, arg1, arg0, arg2, arg3);
}

function snd_stop_delay(arg0, arg1)
{
    return scr_script_delayed(snd_stop, arg1, arg0);
}
