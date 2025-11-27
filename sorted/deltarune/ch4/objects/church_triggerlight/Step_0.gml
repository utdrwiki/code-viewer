if (init == 0)
{
    init = 1;
    if (permaflag != -1 && global.flag[permaflag])
    {
        with (instance_create(lightxpos, lightypos, obj_light_following))
        {
            size = other.lightsize;
            instance_destroy();
        }
    }
}
if (place_meeting(x, y, obj_mainchara) || trigger == 1)
    trigger = 2;
if (trigger == 2)
{
    with (instance_create(lightxpos, lightypos, obj_light_following))
    {
        target = 0;
        size = 1;
        scr_lerpvar("size", 1, other.lightsize, other.fadeintime, -1, "out");
        depth = -4;
        snd_play(snd_noise, 0.4, 0.6);
        snd_play(snd_spearappear, 0.7, 1.4);
    }
    instance_destroy();
    trigger = 3;
    instance_destroy();
}
