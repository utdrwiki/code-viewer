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

function scr_dir_to_vector(arg0)
{
    var __dir = arg0[0];
    var __len = 1;
    if (argument_count > 1)
        __len = arg0[1];
    return new Vector2(lengthdir_x(__dir, __len), lengthdir_y(__dir, __len));
}
