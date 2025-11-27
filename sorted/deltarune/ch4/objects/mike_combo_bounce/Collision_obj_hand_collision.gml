if (action > 2 && action < 6)
{
    fade = 1;
    if (cooldown < 0)
    {
        cooldown = 30;
        alarm[0] = 1;
        hp -= 1;
    }
    if (hp < (hp_max * 0.75))
        active = false;
    if (image_xscale > 1)
    {
        image_xscale = scr_approach(image_xscale, 0.25, 0.025);
        image_yscale = image_xscale;
    }
    else
    {
        sc = scr_approach(sc, 0.5, 0.05);
    }
    maxspeed += 2;
    if (hp > 0)
    {
        snd_play(snd_swat);
        friction = 0.1;
        motion_set(point_direction(obj_mike_controller.x, obj_mike_controller.y, x, y) + irandom_range(-30, 30), speed + 8);
    }
    else
    {
        shake = 1;
        alarm[2] = 30;
        mus_volume(global.currentsong[1], 0, 0);
        with (obj_mike_cat)
        {
            scr_sparkle(5);
            instance_destroy();
        }
        alarm[1] = 1;
        room_speed = 1;
        motion_set(point_direction(x, y, xstart, ystart), speed + 16);
        with (obj_mike_boundary)
            instance_destroy();
    }
    var num = 8;
    dir = irandom(360);
    for (i = 0; i < num; i++)
    {
        with (instance_create_depth(x + lengthdir_x(16, (i / num) * 360), y + lengthdir_y(16, (i / num) * 360), depth - 1, obj_heart_sparkle))
            motion_set(other.dir, irandom_range(4, 6));
        dir += ((i / num) * 360);
    }
    with (other)
        instance_destroy();
}
