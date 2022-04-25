if (bust == 0)
{
    global.interact = 1
    instance_create_ch1(0, 0, obj_shake_ch1)
    snd_play_ch1(snd_cough_ch1)
    alarm[3] = 6
    bust = 1
    for (i = 0; i < 12; i += 1)
        instance_create_ch1(((x + 20) + (i * 6)), ((y + 20) + random(25)), obj_dustball_pilebreak_ch1)
}
