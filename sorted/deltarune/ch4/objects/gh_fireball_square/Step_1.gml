if (!init)
{
    init = true;
    mask_index = -1;
    path_add_point(path, basex, basey - (width * vflip), 100);
    path_add_point(path, basex + (width * hflip), basey - (width * vflip), 100);
    path_add_point(path, basex + (width * hflip), basey, 100);
    path_add_point(path, basex + (width * hflip), basey + (width * vflip), 100);
    path_add_point(path, basex, basey + (width * vflip), 100);
    path_add_point(path, basex - (width * hflip), basey + (width * vflip), 100);
    path_add_point(path, basex - (width * hflip), basey, 100);
    path_add_point(path, basex - (width * hflip), basey - (width * vflip), 100);
    path_add_point(path, basex, basey - (width * vflip), 100);
    path_start(path, (width * 4) / cycle_length, path_action_restart, true);
}
if (iris && (path_speed != 0 || width == 0))
{
    if (trueprevx == x && trueprevy == y)
        iris_dir = scr_at_player();
    else
        iris_dir = (iris_dir + (angle_difference(point_direction(trueprevx, trueprevy, x, y), iris_dir) / 5)) % 360;
}
trueprevx = x;
trueprevy = y;
