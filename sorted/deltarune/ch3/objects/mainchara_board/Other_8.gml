if (runawayfromsusie == true)
    exit;
is_moving = false;
is_moving_timer = 0;
speed = 0;
image_index = 0;
if (path_end_facing != -1)
{
    facing = path_end_facing;
    path_end_facing = -1;
}
