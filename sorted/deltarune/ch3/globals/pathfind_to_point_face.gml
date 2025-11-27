function scr_pathfind_to_point_face(arg0, arg1, arg2, arg3)
{
    var __destx = arg1 + 16;
    var __desty = arg2 + 16;
    if (arg1 < 12 && arg2 < 8)
    {
        __destx = 128 + (32 * arg1) + 16;
        __desty = 64 + (32 * arg2) + 16;
    }
    with (obj_mainchara_board)
    {
        if (name == arg0)
        {
            path_end();
            is_moving_timer = 0;
            is_moving = true;
            path_target_x = __destx;
            path_target_y = __desty;
            if (arg0 == "ralsei")
                follow = false;
            path_end_facing = arg3;
        }
    }
}
