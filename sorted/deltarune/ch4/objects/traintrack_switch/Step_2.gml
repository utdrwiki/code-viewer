if (pressed == 0)
{
    var _waiting = false;
    with (obj_traintrack_moving_parent)
    {
        if (con != 0)
            _waiting = true;
    }
    if (!_waiting && (place_meeting(x, y, obj_homealone_heart) || place_meeting(x, y, obj_train_snowball)))
        pressed = 1;
}
else if (pressed == 1)
{
    pressed = 2;
    snd_play_pitch(snd_noise, 1.2);
}
else if (pressed == -1 || pressed == -2)
{
    pressed = 0;
    snd_play_pitch(snd_noise, 0.8);
}
else if (pressed == 2)
{
    var _waiting = false;
    with (obj_traintrack_moving_parent)
    {
        if (con != 0)
            _waiting = true;
    }
    if (!_waiting && !place_meeting(x, y, obj_homealone_heart) && !place_meeting(x, y, obj_train_snowball))
    {
        if (toggle)
            pressed = -2;
        else
            pressed = -1;
    }
}
if (pressed == 0)
    image_index = 0;
else
    image_index = 1;
