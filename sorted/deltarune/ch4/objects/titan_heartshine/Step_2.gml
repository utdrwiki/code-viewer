if (timer >= 12)
{
    var _range = remap_clamped(12, 20, 100, 800, timer);
    var _power = remap_clamped(12, 20, 10, 40, timer);
    var _xx = x;
    var _yy = y;
    with (obj_make_fountain_ball_titan)
    {
        var _dir = point_direction(x, y, _xx, _yy);
        var _len = point_distance(x, y, _xx, _yy);
        if (_range < _len)
            continue;
        image_angle = _dir;
        x -= (lengthdir_x(_power, _dir) / 10);
        y -= (lengthdir_y(_power, _dir) / 10);
        if (image_index < (image_number - 1))
        {
            image_index += 0.25;
            if (back == 0)
                image_blend = merge_color(c_black, c_white, image_index / (image_number - 1));
        }
        else
        {
            visible = false;
        }
        if (image_xscale <= 0)
            instance_destroy();
    }
}
