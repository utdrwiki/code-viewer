if (goto_score)
{
    var _gx = 500;
    var _gy = 20;
    move_towards_point(_gx, _gy, 16);
    if (y <= 48)
        depth = -25;
    if (point_distance(x, y, _gx, _gy) <= 16)
        instance_destroy();
}
