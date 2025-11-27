var doend = false;
coolsize *= 0.8;
repeat (5)
{
    image_angle = direction;
    var afterimage = scr_afterimage_grow();
    with (afterimage)
    {
        fade = 0;
        xrate = 0;
        yrate = -0.2;
    }
    x += lengthdir_x(spd / 5, direction);
    y += lengthdir_y(spd / 5, direction);
    var anglediff = angle_difference(direction, point_direction(x, y, hx, hy));
    direction -= clamp(sign(anglediff) * tracking_val, -abs(anglediff), abs(anglediff));
    tracking_val = scr_approach(tracking_val, 5, 0.5);
    if (point_distance(x, y, hx, hy) < 6)
    {
        doend = true;
        break;
    }
}
if (doend)
{
    image_angle = direction;
    var afterimage = scr_afterimage_grow();
    snd_play(snd_explosion_firework_bc);
    with (afterimage)
    {
        fade = 0;
        xrate = 0;
        yrate = -0.2;
    }
    with (scr_afterimage_grow())
    {
        x = other.hx;
        y = other.hy;
        sprite_index = spr_darkshape_blast_impact;
        image_xscale = 2;
        image_yscale = 2;
        image_angle = irandom(360);
        fade = 0;
        xrate = -0.4;
        yrate = -0.4;
    }
    repeat (8 + irandom(8))
    {
        with (instance_create_depth(x + random_range(-12, 12), y + random_range(-12, 12), depth + 2, obj_particle_generic))
        {
            image_xscale *= (1 + random(3));
            image_blend = c_white;
            direction = point_direction(other.x, other.y, other.xprevious, other.yprevious) + random_range(-60, 60);
            image_angle = direction;
            speed = 12 + random(16);
            acceleration_type = 1;
            shrink_rate = 0.1 + random(0.1);
            acceleration_rate = 0.9 - random(0.1);
        }
    }
    instance_destroy();
}
