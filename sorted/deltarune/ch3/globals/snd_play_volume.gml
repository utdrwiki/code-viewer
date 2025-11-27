function snd_play_volume(arg0, arg1)
{
    var _mysnd = audio_play_sound(arg0, 50, 0);
    snd_volume(_mysnd, arg1, 0);
    return _mysnd;
}

function sound_play_volume(arg0, arg1)
{
    snd_play_volume(arg0, arg1);
}

function soundplay_volume(arg0, arg1)
{
    snd_play_volume(arg0, arg1);
}
