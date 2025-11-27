if (position_factor == 1)
{
    if (current_track.object_index == obj_traintrack_goal)
    {
        if (train_index == (controller.train_piece_num - 1))
            controller.reached_goal = true;
        with (obj_train_station)
        {
            if (heartontrain)
                heartontrain = false;
        }
        visible = false;
        exit;
    }
    dir = (current_track_exit_angle + (controller.reversing * 180)) % 360;
    image_index = dir div 90;
    var _trackstop = collision_point(x + lengthdir_x(10, current_track_exit_angle), y + lengthdir_y(10, current_track_exit_angle), obj_traintrack_stop, false, true);
    if (_trackstop != -4)
    {
        controller.active = false;
        controller.do_reverse = true;
        controller.reverse_active = true;
        exit;
    }
    var _track = collision_point(x + lengthdir_x(10, current_track_exit_angle), y + lengthdir_y(10, current_track_exit_angle), obj_traintrack_parent, false, true);
    var _found_piece = false;
    if (instance_exists(obj_train_icee))
    {
        if (place_meeting(x + lengthdir_x(10, current_track_exit_angle), y + lengthdir_y(10, current_track_exit_angle), obj_train_icee) && !obj_train_icee.can_pass)
        {
            if ((train_index == 0 && controller.reversing == false) || (train_index == (controller.train_piece_num - 1) && controller.reversing == true))
            {
                _track = -4;
                controller.reverse_active = true;
                controller.heartontrain = false;
                obj_homealone_heart.freeze = 0;
                with (obj_train_station)
                    heartontrain = false;
            }
        }
    }
    if (_track != -4 && _track.train_occupied == false)
    {
        var _required_angle = (current_track_exit_angle + 180) % 360;
        var _required_angle2 = current_track_exit_angle;
        if (_track.object_index == obj_traintrack_goal || _track.object_index == obj_traintrack_fourway || _track.entrance_a_angle == _required_angle || _track.entrance_b_angle == _required_angle || _track.entrance_a_angle == _required_angle2 || _track.entrance_b_angle == _required_angle2)
        {
            prev_x = x;
            prev_y = y;
            with (current_track)
                train_occupied = false;
            with (_track)
            {
                if (object_index != obj_traintrack_goal)
                    train_occupied = true;
            }
            current_track_entrance_angle = _required_angle;
            if (_track.object_index != obj_traintrack_fourway)
            {
                if (_track.entrance_a_angle == _required_angle)
                    current_track_exit_angle = _track.entrance_b_angle;
                else
                    current_track_exit_angle = _track.entrance_a_angle;
            }
            position_factor = 0;
            current_track = _track;
            _found_piece = true;
        }
    }
    if (!_found_piece)
    {
        if ((train_index == 0 && controller.reversing == false) || (train_index == (controller.train_piece_num - 1) && controller.reversing == true))
            controller.do_reverse = true;
    }
}
if (position_factor < 1)
{
    position_factor += (controller.train_speed / 10);
    position_factor = clamp(position_factor, 0, 1);
    x = lerp(prev_x, current_track.x + 5, position_factor);
    y = lerp(prev_y, current_track.y + 5, position_factor);
}
