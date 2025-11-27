if (init == 0)
{
    if (image_index != 0)
    {
        start_angle = (image_index - 1) * 45;
        rotation = 0;
    }
    else
    {
        image_index = round(scr_loop(true_angle, 360) / 45) + 1;
    }
    init = 1;
    timer = start_delay;
    if (range < 360)
        true_angle = lerp(-range / 2, range / 2, start_amount);
}
if (init == -1)
    exit;
timer--;
if (timer <= 0)
{
    var _trangle = true_angle;
    if (loop_type == 0)
        _trangle = scr_loop_ext(true_angle, -range / 2, range / 2);
    else if (loop_type == 1)
        _trangle = scr_pingpong_ext(true_angle, -range / 2, range / 2);
    else if (loop_type == 2)
        _trangle = random_range(-range / 2, range / 2);
    image_index = round(scr_loop(true_angle, 360) / 45) + 1;
    var _sangle = _trangle + start_angle;
    if (loop_type != 2 && spread_angle < 360)
        _sangle -= (spread_angle / 2);
    repeat (shot_count)
    {
        d = instance_create(x, y, child_bullet);
        d.direction = _sangle;
        if (angle_bullet)
            d.image_angle = _sangle;
        d.damage = damage;
        if (child_speed > -999)
            d.speed = child_speed;
        d.destroyoffscreen = false;
        d.special = special;
        if (loop_type == 2)
            _sangle = start_angle + random_range(-range / 2, range / 2);
        else if (spread_angle < 360)
            _sangle += (spread_angle / (shot_count - 1));
        else
            _sangle += (spread_angle / shot_count);
    }
    timer = fire_rate;
    if (loop_type != 2)
    {
        true_angle += rotation;
        if (true_angle > (range * 2))
            true_angle -= (range * 2);
        else if (true_angle < (-range * 2))
            true_angle += (range * 2);
    }
}
