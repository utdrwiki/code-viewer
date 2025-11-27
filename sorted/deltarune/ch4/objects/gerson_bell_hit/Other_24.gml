if (con == 0)
{
    timer++;
    if (timer == 14)
        snd_play(motor_upper_quick_mid);
    if (timer == 16)
    {
        con = 1;
        timer = 0;
        snd_play(snd_queen_punched_lower);
        snd_play(snd_bell);
        image_index = 1;
        scr_shakeobj();
        bell = instance_nearest(x, y, obj_gerson_bell);
        var angle_offset = random(60) - 30;
        if (image_xscale > 0)
        {
            with (bell)
            {
                shakeobj = instance_create(x, y, obj_shakedirectional);
                shakeobj.target = id;
                shakeobj.dir = 180;
            }
            for (i = 0; i < 7; i++)
            {
                radialshot = instance_create(bell.x + 42, bell.y + 60, obj_gerson_bell_bullet_radial);
                with (radialshot)
                    scr_bullet_init();
                radialshot.active = 1;
                radialshot.place = (270 - (30 * i)) + angle_offset;
                radialshot.depth = depth - 1;
                radialshot.target = 3;
                radialshot.damage = 1;
                radialshot.grazed = 0;
            }
        }
        else
        {
            with (bell)
            {
                shakeobj = instance_create(x, y, obj_shakedirectional);
                shakeobj.target = id;
                shakeobj.dir = 0;
            }
            for (i = 0; i < 7; i++)
            {
                radialshot = instance_create(bell.x + 42, bell.y + 60, obj_gerson_bell_bullet_radial);
                with (radialshot)
                    scr_bullet_init();
                radialshot.active = 1;
                radialshot.place = 250 + (30 * i) + angle_offset;
                radialshot.depth = depth - 1;
                radialshot.target = 3;
                radialshot.damage = 1;
                radialshot.grazed = 0;
            }
        }
    }
}
if (con == 1)
{
    timer++;
    if (timer == 6)
    {
        timer = 0;
        con = 2;
        image_index = 2;
    }
}
if (con == 2)
{
    timer++;
    if (timer == 6)
    {
        timer = -47;
        con = 0;
        image_index = 0;
    }
}
if (global.turntimer < 1)
    instance_destroy();
