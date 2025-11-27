with (obj_train_piece_parent)
{
    if (controller == other.id)
        instance_destroy();
}
train_pieces = [];
reached_goal = false;
for (var _t = 0; _t < train_piece_num; _t++)
{
    var _offset = _t * -10;
    var _tx = start_x + lengthdir_x(_offset, start_dir);
    var _ty = start_y + lengthdir_y(_offset, start_dir);
    var _train_piece = instance_create_depth(_tx, _ty, depth, (_t == 0) ? obj_train_piece_head : obj_train_piece_carriage);
    with (_train_piece)
    {
        controller = other.id;
        train_index = _t;
        image_index = other.image_index;
        current_track_exit_angle = other.start_dir;
        current_track_entrance_angle = (other.start_dir + 180) % 360;
        current_track = collision_point(x, y, obj_traintrack_parent, false, true);
    }
    array_push(train_pieces, _train_piece);
}
