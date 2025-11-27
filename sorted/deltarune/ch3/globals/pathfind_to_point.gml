function scr_pathfind_to_point(arg0, arg1, arg2)
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
            follow = false;
            if (argument_count == 4)
            {
                if (argument3 != -1)
                    path_end_facing = argument3;
            }
            if (argument_count == 5)
            {
                if (argument4 != -1)
                    allow_diagonals = argument4;
            }
        }
    }
}
