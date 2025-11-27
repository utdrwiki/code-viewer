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
        var slowbullet1 = irandom(4);
        bell = instance_nearest(x, y, obj_gerson_bell);
        if (image_xscale > 0)
        {
            with (bell)
            {
                shakeobj = instance_create(x, y, obj_shakedirectional);
                shakeobj.target = id;
                shakeobj.dir = 180;
            }
            for (i = 0; i < 5; i++)
            {
                if (i == slowbullet1)
                    continue;
                bulletshot = instance_create(bell.x + 42, bell.y + 60, obj_gerson_bell_bullet);
                with (bulletshot)
                    scr_bullet_init();
                bulletshot.image_xscale = 1.4;
                bulletshot.image_yscale = 1.4;
                bulletshot.active = 1;
                bulletshot.direction = 180;
                bulletshot.pos = i;
                bulletshot.depth = depth - 1;
                bulletshot.target = 3;
                bulletshot.damage = 1;
                bulletshot.grazed = 0;
            }
            var radial = 5;
            var dir = 0;
            if (bighearttype == 1 && y < obj_growtangle.y)
                dir = 25 + random(10);
            if (bighearttype == 1 && y > obj_growtangle.y)
                dir = (random(10) * -1) - 25;
            for (i = 0; i < radial; i++)
            {
                radialshot = instance_create(x, y, obj_collidebullet);
                with (radialshot)
                    scr_bullet_init();
                radialshot.sprite_index = spr_diamondbullet;
                radialshot.direction = ((i / radial) * 180) + 110 + dir;
                radialshot.image_angle = radialshot.direction;
                radialshot.active = 1;
                radialshot.speed = 1;
                radialshot.friction = -0.3;
                if (bighearttype == 1)
                {
                    radialshot.speed = 1;
                    radialshot.friction = -0.23;
                }
                radialshot.depth = depth - 1;
                radialshot.target = target;
                radialshot.damage = damage;
                radialshot.grazed = 0;
                radialshot.element = 6;
                if (obj_spamton_neo_enemy.difficulty == 0)
                    radialshot.grazepoints = 3;
                if (obj_spamton_neo_enemy.difficulty == 2)
                    radialshot.grazepoints = 2;
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
