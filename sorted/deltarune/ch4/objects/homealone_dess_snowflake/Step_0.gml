if (stop_blowing)
{
    if (!is_blowing)
        exit;
    stop_blowing = false;
    is_blowing = false;
    angleV = 0.04;
}
if (start_blowing)
{
    if (is_blowing)
        exit;
    start_blowing = false;
    is_blowing = true;
    push = true;
    push_timer = 0;
    angle_temp = angle;
    angleV = 0;
    stop_timer = 0;
}
if (pull_down)
{
    pull_down = false;
    stop_timer = 0;
    angleV = -angleV;
    push_timer = 0;
}
if (push)
{
    push_timer++;
    if (push_timer == 1)
    {
        var target_angle = is_hit ? 1.5707963267948966 : 0.7853981633974483;
        scr_lerp_instance_var(id, "angle", angle_temp, target_angle, 4);
    }
    if (is_hit)
    {
        if (push_timer == 8)
        {
            if (!snowflake_finished)
            {
                snowflake_finished = true;
                with (obj_homealone_dess_closet_controller)
                    drop_ornament = true;
            }
            is_hit = false;
        }
    }
    if (push_timer >= 8)
    {
        var force = swing_gravity * sin(angle);
        angleA = (-1 * force) / len;
        angleV += angleA;
        if (!is_blowing)
        {
            angle += angleV;
            stop_timer++;
            if (stop_timer >= 240)
            {
                angleV *= 0.98;
                if (angleA < 0.00001 && force < 0.0001)
                {
                    angleV = 0;
                    angle = 0;
                }
            }
        }
    }
    x = (len * sin(angle)) + origin_x;
    y = (len * cos(angle)) + origin_y;
}
