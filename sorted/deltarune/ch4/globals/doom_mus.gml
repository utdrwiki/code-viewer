function scr_doom_mus(arg0, arg1, arg2 = true)
{
    if (arg2)
        audio_sound_gain(arg0, 0, (arg1 * 1000) / fps);
    var doomer = instance_create_depth(x, y, 0, obj_mus_doom);
    doomer.mysong = arg0;
    with (doomer)
        alarm_set(0, round(arg1));
    return doomer;
}
