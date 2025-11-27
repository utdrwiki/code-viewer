if (delay)
{
    delay--;
    if (delay == 0)
    {
        with (bullet1)
            active = true;
        with (bullet2)
            active = true;
        with (bullet3)
            active = true;
    }
}
else
{
    dist = scr_approach_curve(dist, dist_max, 20 + (dist / 4));
    dir += (((flipside * 3.5 * dist) / dist_max) * sqr(image_alpha));
    if (total_rot < 360)
    {
        total_rot += ((3.5 * dist) / dist_max);
        if (total_rot >= 360)
        {
            scr_lerpvar_instance(id, "image_alpha", 1, 0, 20);
            scr_lerpvar_instance(id, "image_xscale", 2, 0, 30);
            scr_lerpvar_instance(id, "image_yscale", 2, 0, 30);
            with (bullet1)
            {
                active = false;
                scr_lerpvar_instance(id, "image_alpha", 1, 0, 20);
                scr_lerpvar_instance(id, "image_xscale", 2, 0, 30);
                scr_lerpvar_instance(id, "image_yscale", 2, 0, 30);
            }
            with (bullet2)
            {
                active = false;
                scr_lerpvar_instance(id, "image_alpha", 1, 0, 20);
                scr_lerpvar_instance(id, "image_xscale", 2, 0, 30);
                scr_lerpvar_instance(id, "image_yscale", 2, 0, 30);
            }
            with (bullet3)
            {
                active = false;
                scr_lerpvar_instance(id, "image_alpha", 1, 0, 20);
                scr_lerpvar_instance(id, "image_xscale", 2, 0, 30);
                scr_lerpvar_instance(id, "image_yscale", 2, 0, 30);
            }
        }
    }
    var angle = dir;
    var tdist = dist;
    with (bullet1)
    {
        x = other.x + lengthdir_x(tdist * 0.1, angle);
        y = other.y + lengthdir_y(tdist * 0.1, angle);
    }
    with (bullet2)
    {
        x = other.x + lengthdir_x(tdist * 0.55, angle);
        y = other.y + lengthdir_y(tdist * 0.55, angle);
    }
    with (bullet3)
    {
        x = other.x + lengthdir_x(tdist, angle);
        y = other.y + lengthdir_y(tdist, angle);
    }
}
