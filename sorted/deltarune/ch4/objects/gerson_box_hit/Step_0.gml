if (con == 0)
{
    timer++;
    if (timer > 16 && image_index < 5)
        image_index += 0.5;
    if (timer == 18)
        snd_play(motor_upper_quick_mid);
    if (timer == 20)
    {
        con = 1;
        timer = 0;
        snd_play(snd_queen_punched_lower);
        scr_shakeobj();
        var slowbullet1 = irandom(8);
        var slowbullet2 = slowbullet1 + 1;
        var slowbullet3 = slowbullet1 + 5;
        if (slowbullet3 > 8)
            slowbullet3 -= 10;
        var slowbullet4 = slowbullet3 + 1;
        var side_x = 80;
        var dir = 0;
        if (image_xscale > 0)
        {
            dir = 180;
            with (obj_growtangle)
            {
                shakeobj = instance_create(x, y, obj_shakedirectional);
                shakeobj.target = id;
                shakeobj.dir = 180;
            }
        }
        else
        {
            side_x = -80;
            with (obj_growtangle)
            {
                shakeobj = instance_create(x, y, obj_shakedirectional);
                shakeobj.target = id;
                shakeobj.dir = 0;
            }
        }
        var rand = choose(1, 2, 3, 4, 5, 6);
        if (rand == 0)
        {
            for (i = 0; i < 10; i++)
            {
                bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * i), obj_box_hit_bullet);
                with (bulletshot)
                    scr_bullet_init();
                bulletshot.direction = dir;
                bulletshot.speed = 5.6 + random(2);
                bulletshot.friction = 0.14;
                bulletshot.depth = depth - 1;
                if (i == slowbullet1 || i == slowbullet2 || i == slowbullet3 || i == slowbullet4)
                {
                    bulletshot.speed = 2 + random(1.5);
                    bulletshot.friction = 0.08;
                }
            }
        }
        if (rand == 1)
        {
            var aa = 0;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7.2;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 6.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 6.4;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 6;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.4;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.4;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 6;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 6.4;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 6.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7.2;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
        }
        if (rand == 2)
        {
            var aa = 0;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
        }
        if (rand == 3)
        {
            var aa = 0;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7.6;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
        }
        if (rand == 4)
        {
            var aa = 0;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
        }
        if (rand == 5)
        {
            var aa = 0;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 6.2;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 6.2;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
        }
        if (rand == 6)
        {
            var aa = 0;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4.6;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 4;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 3.4;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 5.4;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 5.5;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 5.6;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 6;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 6.4;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 6.8;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
            bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (15 * aa), obj_box_hit_bullet);
            with (bulletshot)
                scr_bullet_init();
            bulletshot.direction = dir;
            bulletshot.speed = 7.2;
            bulletshot.friction = 0.14;
            bulletshot.depth = depth - 1;
            aa++;
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
    }
}
if (con == 2)
{
    timer++;
    if (timer == 1)
    {
        if (image_xscale == -2)
            instance_create(x - 60, y + 20, obj_gerson_teleport);
        else
            instance_create(x + 60, y + 20, obj_gerson_teleport);
        instance_destroy();
    }
}
