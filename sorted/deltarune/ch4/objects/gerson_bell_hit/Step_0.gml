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
        image_index = 1;
        scr_shakeobj();
        bell = instance_nearest(x, y, obj_gerson_bell);
        var angle_offset = random(40) - 20;
        if (image_xscale > 0)
        {
            with (bell)
            {
                shakeobj = instance_create(x, y, obj_shakedirectional);
                shakeobj.target = id;
                shakeobj.dir = 180;
            }
            if (choose(0, 1) == 0)
            {
                snd_play_pitch(snd_bell, 0.8);
                for (i = 0; i < 7; i++)
                {
                    radialshot = instance_create(bell.x + 42, bell.y + 60, obj_gerson_bell_bullet_radial);
                    with (radialshot)
                        scr_bullet_init();
                    radialshot.active = 1;
                    radialshot.place = (220 - (24 * i)) + angle_offset;
                    radialshot.depth = depth - 1;
                    radialshot.target = 3;
                    radialshot.damage = 1;
                    radialshot.grazed = 0;
                }
            }
            else
            {
                snd_play_pitch(snd_bell, 1.1);
                for (i = 0; i < 10; i++)
                {
                    radialshot = instance_create(bell.x + 22, bell.y + 60, obj_gerson_bell_bullet_radial);
                    with (radialshot)
                        scr_bullet_init();
                    radialshot.active = 1;
                    radialshot.place = (220 - (16 * i)) + angle_offset;
                    radialshot.depth = depth - 1;
                    radialshot.target = 3;
                    radialshot.type = 1;
                    radialshot.damage = 1;
                    radialshot.grazed = 0;
                }
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
            if (choose(0, 1) == 0)
            {
                snd_play_pitch(snd_bell, 0.8);
                for (i = 0; i < 7; i++)
                {
                    radialshot = instance_create(bell.x + 22, bell.y + 60, obj_gerson_bell_bullet_radial);
                    with (radialshot)
                        scr_bullet_init();
                    radialshot.active = 1;
                    radialshot.place = 220 + (24 * i) + angle_offset;
                    radialshot.depth = depth - 1;
                    radialshot.target = 3;
                    radialshot.damage = 1;
                    radialshot.grazed = 0;
                }
            }
            else
            {
                snd_play_pitch(snd_bell, 1.1);
                for (i = 0; i < 11; i++)
                {
                    radialshot = instance_create(bell.x + 22, bell.y + 60, obj_gerson_bell_bullet_radial);
                    with (radialshot)
                        scr_bullet_init();
                    radialshot.active = 1;
                    radialshot.place = 220 + (16 * i) + angle_offset;
                    radialshot.depth = depth - 1;
                    radialshot.target = 3;
                    radialshot.type = 1;
                    radialshot.damage = 1;
                    radialshot.grazed = 0;
                }
            }
        }
    }
}
if (con == 1)
{
    timer++;
    if (timer == 4)
    {
        timer = 0;
        con = 2;
        image_index = 2;
    }
}
if (con == 2)
{
    timer++;
    if (timer == 4)
    {
        timer = -22;
        con = 0;
        image_index = 0;
    }
}
if (global.turntimer < 1)
    instance_destroy();
