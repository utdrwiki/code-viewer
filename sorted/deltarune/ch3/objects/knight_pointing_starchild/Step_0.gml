if (!init)
{
    init = true;
    if (difficulty >= 2)
    {
        delay = 25;
        with (obj_dbulletcontroller)
        {
            other.delay += delay;
            if (subdelay == 4)
            {
                subdelay = 0;
                delay += 5;
            }
            else
            {
                subdelay++;
                delay++;
            }
        }
    }
}
event_inherited();
if (!i_ex(obj_knight_roaring2))
{
    if (con <= 2 && con <= 3)
    {
        if (speed > minspeed)
            speed = scr_movetowards(speed, minspeed, deceleration);
        if (con == 0)
        {
            if (delay > 0)
            {
                timer++;
                if (timer >= delay)
                {
                    if (!scr_onscreen_tolerance(self, 10))
                        instance_destroy();
                    timer = 0;
                    con = 1;
                }
            }
        }
    }
    if (con >= 1 && con <= 3)
    {
        target_angle = point_direction(x, y, obj_heart_follower.x + 10, obj_heart_follower.y + 10);
        if (con >= 2 && tracking)
        {
            var _difference = angle_difference(target_angle, direction);
            if (abs(_difference) < 90)
            {
                if (con < 3)
                {
                    direction = scr_rotatetowards(direction, target_angle, 2);
                    image_angle = direction;
                }
                else if (abs(_difference) <= 4)
                {
                    rotation = 0;
                }
                else if (abs(_difference) > 30)
                {
                    rotation = sign(_difference) * 2;
                }
                else
                {
                    rotation = sign(_difference);
                }
            }
            else if (con >= 3)
            {
                tracking = false;
                rotation = sign(rotation);
            }
        }
        else
        {
            direction += rotation;
            image_angle += rotation;
        }
    }
    if (con == 1)
    {
        image_angle = scr_angle_lerp(direction, target_angle, timer / 10);
        timer++;
        if (timer >= 10)
        {
            timer = 0;
            con = 2;
            direction = image_angle;
            tracking = true;
        }
        if (xscale_start == 0)
            xscale_start = image_xscale;
        if (yscale_start == 0)
            yscale_start = image_yscale;
        image_yscale = yscale_start * cos((timer / 5) * pi);
        image_blend = merge_color(c_white, c_black, cos((timer / 5) * pi));
        outline = merge_color(c_black, c_red, cos((timer / 5) * pi));
    }
    if (con == 2)
    {
        timer++;
        if (timer >= 10)
        {
            timer = 0;
            con = 3;
        }
    }
    if (con >= 1 && ease < 40)
    {
        var _speed = (1 - (ease / 40)) * 2;
        x -= lengthdir_x(_speed, target_angle);
        y -= lengthdir_y(_speed, target_angle);
        ease++;
    }
    if (con == 3)
    {
        speed = scr_movetowards(speed, 25, 0.5);
        image_xscale = xscale_start + (speed / 60);
        image_yscale = yscale_start - (speed / 90);
        var _afbm = scr_custom_afterimage(obj_afterimage_blend);
        _afbm = scr_custom_afterimage(obj_afterimage_blend);
        _afbm.image_blend = c_red;
        _afbm.fadeSpeed = 0.25;
        _afbm.image_alpha = 0.5;
        _afbm.direction = image_angle;
        _afbm.speed = 1;
    }
    if (con == 4)
    {
        speed = 0;
        timer++;
        if (timer >= 4)
            instance_destroy();
    }
}
