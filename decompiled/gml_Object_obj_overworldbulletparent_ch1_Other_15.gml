if (active == true)
{
    snd_stop_ch1(snd_hurt1_ch1)
    snd_play_ch1(snd_hurt1_ch1)
    if (target != 3)
        scr_damage_ch1()
    if (target == 3)
        scr_damage_all_overworld_ch1()
    with (obj_darkcontroller_ch1)
        charcon = 1
    global.interact = 1
    with (obj_mainchara_ch1)
        alarm[1] = 7
}
