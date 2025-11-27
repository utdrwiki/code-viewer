function scr_pathfind_to_closest_point_32x32(arg0, arg1, arg2, arg3, arg4)
{
    with (obj_mainchara_board)
    {
        if (name == arg0)
        {
            allow_diagonals = arg4;
            var __destx = arg1 + 16;
            var __desty = arg2 + 16;
            if (arg1 < 12 && arg2 < 8)
            {
                __destx = 128 + (32 * arg1) + 16;
                __desty = 64 + (32 * arg2) + 16;
            }
            var dist = 999;
            var found_spot = false;
            if (mp_grid_path(global.grid, path, x + 16, y + 16, __destx + 2, __desty - 32, arg4) == 1)
            {
                if (distance_to_point(__destx + 2, __desty - 32) < dist)
                {
                    dist = distance_to_point(__destx, __desty - 32);
                    path_target_x = __destx + 2;
                    path_target_y = __desty - 32;
                    if (arg3 == -1)
                        grab_dir = 0;
                    found_spot = true;
                }
            }
            if (mp_grid_path(global.grid, path, x + 16, y + 16, __destx + 34, __desty, arg4) == 1)
            {
                if (distance_to_point(__destx + 34, __desty) < dist)
                {
                    dist = distance_to_point(__destx + 34, __desty);
                    path_target_x = __destx + 34;
                    path_target_y = __desty;
                    if (arg3 == -1)
                        grab_dir = 3;
                    found_spot = true;
                }
            }
            if (mp_grid_path(global.grid, path, x + 16, y + 16, __destx - 32, __desty, arg4) == 1)
            {
                if (distance_to_point(__destx - 32, __desty) < dist)
                {
                    dist = distance_to_point(__destx - 32, __desty);
                    path_target_x = __destx - 32;
                    path_target_y = __desty;
                    if (arg3 == -1)
                        grab_dir = 1;
                    found_spot = true;
                }
            }
            if (mp_grid_path(global.grid, path, x + 16, y + 16, __destx, __desty + 30, arg4) == 1)
            {
                if (distance_to_point(__destx, __desty + 30) < dist)
                {
                    dist = distance_to_point(__destx, __desty + 30);
                    path_target_x = __destx + 2;
                    path_target_y = __desty + 30;
                    if (arg3 == -1)
                        grab_dir = 2;
                    found_spot = true;
                }
            }
            if (found_spot == true)
            {
                path_end();
                is_moving_timer = 0;
                is_moving = true;
                if (arg0 == "ralsei")
                    follow = false;
                path_end_facing = grab_dir;
            }
            else
            {
                show_debug_message("PATHFINDING ERROR 5: cannot path to target location");
            }
        }
    }
}
