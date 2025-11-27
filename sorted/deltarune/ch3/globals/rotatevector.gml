function scr_rotatevector(arg0, arg1)
{
    if (arg1 == 0)
        return arg0;
    var _dir = point_direction(0, 0, arg0.x, arg0.y);
    var _len = point_distance(0, 0, arg0.x, arg0.y);
    arg0.x = lengthdir_x(_len, _dir + arg1);
    arg0.y = lengthdir_y(_len, _dir + arg1);
    return arg0;
}

function scr_rotatevector_xy(arg0, arg1, arg2)
{
    var _tempVector = 
    {
        x: arg0,
        y: arg1
    };
    if (arg2 == 0)
        return _tempVector;
    var _dir = point_direction(0, 0, arg0, arg1);
    var _len = point_distance(0, 0, arg0, arg1);
    _tempVector.x = lengthdir_x(_len, _dir + arg2);
    _tempVector.y = lengthdir_y(_len, _dir + arg2);
    return _tempVector;
}

function scr_dir_to_vector(arg0)
{
    var __dir = arg0[0];
    var __len = 1;
    if (argument_count > 1)
        __len = arg0[1];
    return new Vector2(lengthdir_x(__dir, __len), lengthdir_y(__dir, __len));
}

function scr_rotatevector_around(arg0, arg1, arg2)
{
    var __dir = Vector2_direction(arg1, arg0);
    var __len = Vector2_distance(arg1, arg0);
    arg0.x = arg1.x + lengthdir_x(__len, __dir + arg2);
    arg0.y = arg1.y + lengthdir_y(__len, __dir + arg2);
    return arg0;
}

function Vector2_distance(arg0, arg1)
{
    return point_distance(arg0.x, arg0.y, arg1.x, arg1.y);
}

function Vector2_direction(arg0, arg1)
{
    return point_direction(arg0.x, arg0.y, arg1.x, arg1.y);
}
