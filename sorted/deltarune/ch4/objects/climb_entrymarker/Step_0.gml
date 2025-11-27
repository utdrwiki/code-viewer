var active = 0;
with (obj_trigger)
{
    if (extflag == other.extflag)
    {
        if (place_meeting(x, y, obj_mainchara))
            active = 1;
    }
}
if (i_ex(obj_climb_kris))
    active = 0;
image_alpha = lerp(image_alpha, active, 0.125);
