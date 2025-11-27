if (cooldown <= 0 && action > 2 && action < 6)
{
    fade = 1;
    cooldown = 30;
    alarm[0] = 1;
    hp -= 1;
    with (obj_mike_bigcat)
        happiness_speed = scr_approach(happiness_speed, 0.5, 0.1);
    if (hp < (hp_max / 2))
    {
        spin_timer = 30;
        spin_speed = 4;
    }
    attack_timer -= 1;
    if (hp > 0)
    {
        snd_play(snd_explosion_mmx);
        scr_shakescreen();
        var num = 8;
        dir = irandom(360);
        for (i = 0; i < num; i++)
        {
            with (instance_create_depth(x + lengthdir_x(16, (i / num) * 360), y + lengthdir_y(16, (i / num) * 360), depth - 1, obj_heart_sparkle))
                motion_set(other.dir, irandom_range(4, 6));
            dir += ((i / num) * 360);
        }
    }
    else
    {
        phase = 2;
        vspeed = 0;
        timer = 0;
        action = 0;
        shake = 1;
        alarm[2] = 30;
        with (obj_mike_bigcat)
        {
            action = 2;
            happiness = 100;
        }
        with (obj_mike_hairball)
        {
            scr_sparkle(5);
            instance_destroy();
        }
        mus_volume(global.batmusic[1], 0, 0);
        active = false;
        alarm[2] = 1;
        motion_set(point_direction(x, y, xstart, ystart), 16);
    }
}
