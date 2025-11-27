depth = -10;
reached_goal = false;
start_dir = (image_index * 90) % 360;
train_speed = 2;
train_maxspeed = 2;
reversing = false;
do_reverse = false;
reverse_active = true;
train_piece_num = (start_dir == 0 || start_dir == 180) ? abs(image_xscale) : abs(image_yscale);
train_pieces = [];
switch (start_dir)
{
    case 0:
        start_x = bbox_right - 5;
        start_y = bbox_top + 5;
        break;
    case 90:
        start_x = bbox_left + 5;
        start_y = bbox_top + 5;
        break;
    case 180:
        start_x = bbox_left + 5;
        start_y = bbox_top + 5;
        break;
    case 270:
        start_x = bbox_left + 5;
        start_y = bbox_bottom - 5;
        break;
}
event_user(0);
