function scr_movetowards(arg0, arg1, arg2)
{
    if (arg0 == arg1)
        return arg0;
    else if (arg0 > arg1)
        return max(arg0 - arg2, arg1);
    else
        return min(arg0 + arg2, arg1);
}

function scr_obj_movetowards_obj(arg0, arg1, arg2 = 0, arg3 = 0)
{
    scr_obj_movetowards_point(arg0.x + arg2, arg0.y + arg3, arg1);
}

function scr_obj_movetowards_point(arg0, arg1, arg2)
{
    var _distance = point_distance(x, y, arg0, arg1);
    if (arg2 >= _distance)
    {
        x = arg0;
        y = arg1;
    }
    else
    {
        var _direction = point_direction(x, y, arg0, arg1);
        x += lengthdir_x(arg2, _direction);
        y += lengthdir_y(arg2, _direction);
    }
}
