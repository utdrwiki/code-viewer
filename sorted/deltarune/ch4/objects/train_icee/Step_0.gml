if (trigger == -4)
{
    with (obj_traintrack_switch)
    {
        if (extflag == other.extflag)
            other.trigger = id;
    }
}
with (trigger)
{
    if (pressed == 2)
        other.inflation += 1;
    else
        other.inflation -= 0.4;
}
inflation = clamp(inflation, 0, 100);
if (inflation >= 100)
{
    image_speed = 0.2;
    x = xstart;
    can_pass = true;
}
else if (inflation >= 70)
{
    image_speed = 0;
    x = xstart;
    can_pass = true;
}
else if (inflation > 0)
{
    if (inflation >= 40)
    {
        can_pass = true;
        if (place_meeting(x, y, obj_train_piece_parent))
            inflation = max(41, inflation);
    }
    else
    {
        can_pass = false;
    }
    image_speed = 0;
    x = xstart + (sin(current_time / 20) * 0.5) + 0.5;
}
else
{
    image_speed = 0;
    x = xstart;
    can_pass = false;
}
image_angle = ease_out_sine(inflation, -120, 120, 100);
