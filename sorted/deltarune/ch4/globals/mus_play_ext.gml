function mus_play_ext()
{
    global.currentsong[0] = snd_init(argument0);
    var _vol = 1;
    if (argument_count >= 3)
    {
        if (argument2 != -1)
            _vol = argument2;
    }
    snd_volume(global.currentsong[0], _vol, 0);
    if (argument_count >= 4)
    {
        if (argument3 != -1)
            snd_pitch(global.currentsong[0], argument3);
    }
    var loop = false;
    if (argument_count >= 2)
        loop = argument1;
    if (loop)
        global.currentsong[1] = mus_loop(global.currentsong[0]);
    else
        global.currentsong[1] = mus_play(global.currentsong[0]);
    if (argument_count >= 5)
    {
        if (argument4 != -1)
            snd_volume(global.currentsong[0], _vol, argument4);
    }
    return global.currentsong[1];
}
