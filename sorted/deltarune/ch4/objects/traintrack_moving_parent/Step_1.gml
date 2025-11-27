if (trigger == -4)
{
    with (obj_traintrack_switch)
    {
        if (extflag == other.extflag)
            other.trigger = id;
    }
    with (obj_train_station)
    {
        if (extflag == other.extflag)
            other.trigger = id;
    }
}
do_switch = false;
with (trigger)
{
    if (abs(pressed) == 1)
        other.do_switch = true;
}
if (do_switch)
{
    for (var i = 0; i < array_length(track); i++)
    {
        if (i_ex(track[i]) && track[i].train_occupied)
        {
            do_switch = false;
            break;
        }
    }
    if (!do_switch)
    {
        if (trigger.pressed == 1)
            trigger.pressed = 0;
        if (trigger.pressed == -1)
            trigger.pressed = 2;
        if (canflasherror)
            snd_play(snd_error);
        with (obj_traintrack_moving_parent)
        {
            if (extflag == other.extflag)
            {
                do_switch = false;
                if (other.canflasherror)
                {
                    with (instance_create(center_x, center_y, obj_oflash))
                    {
                        depth = other.depth - 1;
                        sprite_index = other.track_sprite;
                        angle = other.track_angle;
                    }
                }
            }
        }
        if (canflasherror)
        {
            canflasherror = false;
            alarm[0] = 30;
        }
    }
}
