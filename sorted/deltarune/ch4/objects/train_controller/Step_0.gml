if (scr_debug())
{
    if (keyboard_check_pressed(ord("A")))
    {
        if (extflag == "null")
            active = true;
    }
    if (keyboard_check_pressed(ord("N")))
        event_user(0);
    if (keyboard_check_pressed(ord("B")))
        do_reverse = true;
}
if (!active || reached_goal)
    exit;
if (do_reverse)
{
    for (var _t = 0; _t < train_piece_num; _t++)
    {
        var _train_piece = train_pieces[_t];
        with (_train_piece)
        {
            var _exit_angle = current_track_exit_angle;
            current_track_exit_angle = current_track_entrance_angle;
            current_track_entrance_angle = _exit_angle;
        }
    }
    reversing = !reversing;
    do_reverse = false;
}
for (var _t = 0; _t < train_piece_num; _t++)
{
    var _train_index = reversing ? (train_piece_num - 1 - _t) : _t;
    var _train_piece = train_pieces[_train_index];
    with (_train_piece)
        event_user(0);
    if (heartontrain && _train_index == 1)
    {
        obj_homealone_heart.freeze = 1;
        obj_homealone_heart.x = _train_piece.x - 5;
        obj_homealone_heart.y = _train_piece.y - 5;
        obj_homealone_heart.depth = _train_piece.depth - 1;
    }
    if (do_reverse || !active)
        break;
}
