if (image_xscale < 1)
    image_xscale += 0.1;
if (image_yscale < 1)
    image_yscale += 0.1;
if (path_position >= 0.5 && path_position < 0.84)
{
    depth = obj_hammer_of_justice_enemy.depth + 1;
    image_blend = c_gray;
}
else
{
    if (path_position >= 0.84)
        image_index = 0;
    depth = obj_hammer_of_justice_enemy.depth - 1;
    image_blend = c_white;
}
if (x != (obj_hammer_of_justice_enemy.x + 38) && y != (obj_hammer_of_justice_enemy.y - 96))
{
    var path_pos = path_position;
    path_end();
    x = obj_hammer_of_justice_enemy.x + 120;
    y = obj_hammer_of_justice_enemy.y + 70;
    path = path_add();
    path_set_kind(path, 1);
    path_set_closed(path, true);
    path_add_point(path, 408, 160, 100);
    path_add_point(path, 304, 184, 100);
    path_add_point(path, 272, 184, 100);
    path_add_point(path, 168, 160, 100);
    path_add_point(path, 272, 136, 100);
    path_add_point(path, 304, 136, 100);
    path_start(path, 4, path_action_continue, false);
    path_position = path_pos;
}
if (path_position >= 0.4 && path_position < 0.8)
{
}
else
{
}
