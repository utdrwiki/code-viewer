if (!show_text)
    exit;
if (con == 0)
{
    con = 5;
    tv_sound = snd_play_pitch(snd_its_tv_time, tv_pitch);
    is_active = true;
}
if (con == 5)
{
    text_timer++;
    if (text_timer >= ((timestamps[timestamp_index] * 30) / tv_pitch))
    {
        con = 10;
        if (timestamp_index < array_length_1d(timestamps))
            timestamp_index++;
    }
}
if (con == 10)
{
    tv_max++;
    scr_var_delay("lights_max", lights_max - 1, 4 / tv_pitch);
    if (tv_max == 4)
        con = 20;
    else
        con = 5;
}
if (con == 20)
{
    con = 21;
    if (!intro_mode)
        alarm[0] = 90;
}
if (con == 22)
{
    con = 0;
    timestamp_index = 0;
    show_text = false;
    is_active = false;
    text_timer = 0;
    snd_free(51);
}
