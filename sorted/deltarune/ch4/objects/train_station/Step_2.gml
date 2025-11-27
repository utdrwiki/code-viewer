if (pressed == 0)
{
    var _waiting = false;
    with (obj_traintrack_moving_parent)
    {
        if (con != 0)
            _waiting = true;
    }
    if (!_waiting && place_meeting(x, y, obj_homealone_heart))
        pressed = 1;
}
else if (pressed == 1)
{
    snd_play_pitch(snd_noise, 1.2);
    obj_homealone_heart.x = heartx;
    obj_homealone_heart.y = hearty;
    holdheart = true;
    hearttimer = 5;
    pressed = 2;
    debug_message("hold");
}
else if (pressed == -1)
{
    snd_play_pitch(snd_noise, 0.8);
    pressed = 0;
}
else if (pressed == 2)
{
    var _waiting = false;
    with (obj_traintrack_moving_parent)
    {
        if (con != 0)
            _waiting = true;
    }
    if (!_waiting && !heartontrain && !place_meeting(x, y, obj_homealone_heart))
        pressed = -1;
}
if (pressed == 0)
    image_index = 0;
else
    image_index = 1;
if (hearttimer > 0)
    hearttimer--;
if (holdheart)
{
    obj_homealone_heart.freeze = 1;
    if (!heartontrain)
    {
        if (hearttimer == 0 && (left_p() || right_p() || up_p() || down_p()))
        {
            obj_homealone_heart.freeze = 0;
            holdheart = false;
        }
    }
}
var _traincarriage = instance_position(center_x, center_y, obj_train_piece_carriage);
if (_traincarriage != -4 && (_traincarriage.train_index == 1 || _traincarriage.train_index == 2))
{
    if (hearttimer == 0 && point_distance(_traincarriage.x, _traincarriage.y, center_x, center_y) < 3)
    {
        if (_traincarriage.controller.heartontrain)
        {
            _traincarriage.controller.heartontrain = false;
            heartontrain = false;
            holdheart = true;
            obj_homealone_heart.x = heartx;
            obj_homealone_heart.y = hearty;
            hearttimer = 10;
            debug_message("off train");
        }
        else if (holdheart && _traincarriage.controller.active)
        {
            _traincarriage.controller.heartontrain = true;
            heartontrain = true;
            hearttimer = 15;
            holdheart = false;
            debug_message("onto train");
        }
    }
}
