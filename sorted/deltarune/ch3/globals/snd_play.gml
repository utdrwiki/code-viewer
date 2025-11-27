function snd_play(arg0, arg1 = 1, arg2 = 1)
{
    var _snd = audio_play_sound(arg0, 50, 0);
    if (arg1 != 1)
        snd_volume(_snd, arg1, 0);
    if (arg2 != 1)
        snd_pitch(_snd, arg2);
    return _snd;
}

function soundplay(arg0, arg1 = 1, arg2 = 1)
{
    var _snd = audio_play_sound(arg0, 50, 0);
    if (arg1 != 1)
        snd_volume(_snd, arg1, 0);
    if (arg2 != 1)
        snd_pitch(_snd, arg2);
    return _snd;
}

function sound_play(arg0, arg1 = 1, arg2 = 1)
{
    var _snd = audio_play_sound(arg0, 50, 0);
    if (arg1 != 1)
        snd_volume(_snd, arg1, 0);
    if (arg2 != 1)
        snd_pitch(_snd, arg2);
    return _snd;
}
