function scr_pathfind_follow(arg0)
{
    with (obj_mainchara_board)
    {
        if (name == arg0)
        {
            path_end();
            path_target_x = -1;
            path_target_y = -1;
            is_moving_timer = 0;
            is_moving = true;
        }
    }
}
