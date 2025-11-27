if (con == 2)
{
    gravity = 0;
}
else
{
    gravity_direction = point_direction(x, y, targetx, targety);
    gravity = 0.3;
}
timer++;
if (con == 0 && distance_to_point(targetx, targety) < 80)
    con = 1;
if (con == 2)
{
    var _lifeD = 10;
    var _t = scr_ease_out(timer / _lifeD, 2);
    sprite_index = spr_gradient_ring;
    image_xscale = (_t * 0.8) + 0.2;
    image_yscale = (_t * 0.8) + 0.2;
    image_blend = c_black;
    image_alpha = 1 - _t;
    speed = 0;
    if (timer >= _lifeD)
        instance_destroy();
    exit;
}
if (!init)
{
    init = true;
    start_distance = distance_to_point(targetx, targety);
}
if (sprite_index == spr_sneo_bigcircle)
{
    image_blend = c_black;
    image_xscale = distance_to_point(targetx, targety) / 400;
    image_yscale = distance_to_point(targetx, targety) / 400;
    if (strongerheal)
    {
        image_xscale = distance_to_point(targetx, targety) / 350;
        image_yscale = distance_to_point(targetx, targety) / 350;
    }
}
else
{
    var _progress = clamp01((start_distance - distance_to_point(targetx, targety)) / start_distance);
    image_index = _progress * image_number;
    image_xscale = (1 - _progress) + 1;
    image_yscale = (1 - _progress) + 1;
    if (strongerheal)
    {
        image_xscale = (1 - _progress) + 1;
        image_yscale = (1 - _progress) + 1;
        image_index = _progress * image_number;
    }
}
if (con == 0)
{
    if (image_alpha < 1)
        image_alpha += 0.1;
}
if (con == 1)
{
    if (image_alpha > 0)
        image_alpha -= 0.2;
    else
        instance_destroy();
}
