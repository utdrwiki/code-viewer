timer++;
if ((timer % 1) == 0)
{
    var grow = scr_afterimage_grow();
    grow.xrate = -0.2;
    grow.yrate = -0.2;
}
if (i_ex(obj_church_candle_lightable))
{
    var candle = instance_nearest(x, y, obj_church_candle_lightable);
    if (distance_to_object(candle) < 10)
        move_towards_point(candle.x, candle.y, speed);
}
if (x > (room_width + 80) || x < -80 || y > (room_height + 80) || y < -80)
    instance_destroy();
