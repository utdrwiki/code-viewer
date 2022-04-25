if (bust == 0)
{
    snd_free_ch1(global.currentsong[0])
    global.interact = 1
    instance_create_ch1(0, 0, obj_shake_ch1)
    snd_play_ch1(snd_cough_ch1)
    con = 10
    bust = 1
    for (i = 0; i < 12; i += 1)
        instance_create_ch1(((x + 20) + (i * 6)), ((y + 20) + random(25)), obj_dustball_pilebreak_ch1)
    s = scr_dark_marker_ch1((x + 10), y, spr_susie_shock_ch1)
    with (s)
        scr_depth_ch1()
    alarm[4] = 2
    with (s)
        hspeed = 10
    with (obj_mainchara_ch1)
        cutscene = false
}
