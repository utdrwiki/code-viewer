if (type == 0)
{
    with (obj_suitspuzz_ch1)
    {
        if (won == 0)
            event_user(2)
    }
}
if (type == 1)
{
    with (obj_suitspuzz_ch1)
    {
        if (won == 0)
            event_user(3)
    }
}
if (type == 2)
{
    with (obj_suitspuzz_ch1)
    {
        if (won == 0)
            event_user(4)
    }
}
snd_play_ch1(snd_noise_ch1)
press_timer = 2
with (obj_mainchara_ch1)
    onebuffer = 3
