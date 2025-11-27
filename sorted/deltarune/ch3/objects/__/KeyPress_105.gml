if (scr_debug())
{
    path_end();
    speed = 0;
    movetimer = 0;
    is_moving_timer = 0;
    is_moving = true;
    mp_grid_path(global.grid, path, x + 16, y + 16, 0, 0, false);
    path_start(path, 3.5, path_action_stop, false);
    if (!mp_grid_path(global.grid, path, x + 16, y + 16, 0, 0, false))
        cantfindpath = true;
    movecon = 1;
    move_type = 1;
}
