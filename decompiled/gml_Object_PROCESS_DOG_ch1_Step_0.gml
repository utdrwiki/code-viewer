buffer++
if (buffer < 60)
    return;
if (button1_p_ch1() && (!start_timer))
{
    fadeout = instance_create_ch1(0, 0, obj_fadeout_ch1)
    with (fadeout)
        fadespeed = 0.02
    start_timer = 1
}
if start_timer
{
    snd_free_all_ch1()
    restart_timer++
}
if (restart_timer == 200)
    game_restart()
