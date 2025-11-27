if (active)
{
    scr_depth_board();
    if (place_meeting(x, y, obj_mainchara_board))
        event_user(0);
}
