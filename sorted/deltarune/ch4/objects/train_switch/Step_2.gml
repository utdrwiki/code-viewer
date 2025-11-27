if (pressed == 0)
{
    if (place_meeting(x, y, obj_homealone_heart))
    {
        snd_play_pitch(snd_noise, 1.2);
        pressed = 1;
    }
}
else if (pressed == 1)
{
    with (obj_train_controller)
    {
        if (extflag == other.extflag)
            active = true;
    }
    pressed = 2;
}
else if (pressed == 2)
{
    if (!place_meeting(x, y, obj_homealone_heart))
    {
        snd_play_pitch(snd_noise, 0.8);
        pressed = 0;
    }
}
if (pressed == 0)
    image_index = 0;
else
    image_index = 1;
