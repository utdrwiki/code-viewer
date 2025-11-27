if (active == 1)
{
    if (!heavy)
    {
        snd_stop(snd_hurt1);
        snd_play(snd_hurt1);
        scr_shakescreen(6, 6);
    }
    else
    {
        snd_stop(snd_closet_impact);
        snd_stop(snd_swallow);
        snd_play_pitch(snd_swallow, 0.5);
        snd_play(snd_closet_impact);
        scr_shakescreen(8, 8);
    }
    global.interact = 1;
    if (target == 99)
    {
    }
    else
    {
        if (target != 3)
            scr_damage();
        if (target == 3)
            scr_damage_all_overworld();
    }
    with (obj_darkcontroller)
        charcon = 1;
    with (obj_mainchara)
        alarm[1] = 12;
    hit = 1;
    if (global.hp[1] <= 1)
    {
    }
}
