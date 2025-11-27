function snd_volume(arg0, arg1, arg2)
{
    audio_sound_gain(arg0, arg1, (arg2 * 1000) / fps);
}

function sound_volume(arg0, arg1, arg2)
{
    snd_volume(arg0, arg1, arg2);
}
