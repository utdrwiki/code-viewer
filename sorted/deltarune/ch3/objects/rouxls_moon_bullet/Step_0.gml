if (con == 1)
{
    timer++;
    image_alpha += 0.05;
    if (timer == 20)
    {
        timer = 0;
        con = 2;
    }
}
if (con == 2)
{
    timer++;
    x = lerp(start_x, target_x, timer / 30);
    y = lerp(start_y, target_y, timer / 30);
    if (timer == 30)
    {
        timer = 0;
        con = 3;
        move_count++;
        start_x = x;
        start_y = y;
        if (move_count == 1)
        {
            target_x = x - 79;
            target_y = y;
        }
        if (move_count == 2)
        {
            target_x = x + 79;
            target_y = y;
        }
        if (move_count == 3)
        {
            target_x = x;
            target_y = y - 79;
        }
    }
}
if (con == 3)
{
    timer++;
    if (timer == 26)
    {
        timer = 0;
        con = 2;
    }
}
if (con == 4)
{
    if (i_ex(obj_rouxls_laser_pointer_controller))
    {
        var xx = real(obj_rouxls_laser_pointer_controller._mouse_x);
        var yy = real(obj_rouxls_laser_pointer_controller._mouse_y);
        if (point_distance(x, y, xx, yy) > 10)
        {
            move_towards_point(xx, yy, 2);
        }
        else
        {
            speed = 0;
            alarm[0] = 30;
        }
    }
    else
    {
        speed = 0;
    }
    if (alarm[0] > 0)
        speed = 0;
}
if (sun == 1 && con > 1)
{
    suntimer++;
    var interval = 18;
    if (interval > 0)
    {
        if ((suntimer % interval) == 0)
        {
            if (i_ex(obj_rouxls_laser_pointer_controller))
            {
                var xx = real(obj_rouxls_laser_pointer_controller._mouse_x);
                var yy = real(obj_rouxls_laser_pointer_controller._mouse_y);
                for (n = 3; n < 6; n++)
                {
                    with (scr_fire_bullet(x, y, obj_rouxls_suncloud_bullets, point_direction(x, y, xx, yy), 0.1, spr_sunbolt))
                    {
                        updateimageangle = 1;
                        image_angle = direction;
                        friction = -0.15;
                    }
                }
            }
            else
            {
                var basedir = irandom(360);
                for (n = 3; n < 6; n++)
                {
                    with (scr_fire_bullet(x, y, obj_rouxls_suncloud_bullets, basedir + (120 * (n + (suntimer / interval))) + random(10), 0.1, spr_sunbolt))
                    {
                        updateimageangle = 1;
                        image_angle = direction;
                        friction = -0.15;
                    }
                }
            }
        }
    }
}
if (sun == 0 && con > 1)
{
    if ((timer % 4) == 0)
        grazed = false;
    tilt += 0.2;
    image_angle = sin(tilt) * 18;
    if (timer == 201)
    {
        with (obj_regularbullet)
        {
            if (sprite_index == spr_lanino_moon)
                active = false;
        }
    }
}
