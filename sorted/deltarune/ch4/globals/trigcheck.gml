function scr_trigcheck(arg0)
{
    var ____trig = 0;
    if (is_string(arg0))
    {
        with (obj_trigger)
        {
            if (extflag == arg0)
            {
                if (place_meeting(x, y, obj_mainchara))
                    ____trig++;
            }
        }
    }
    return ____trig;
}

function scr_trigcheck_ext(arg0, arg1 = id)
{
    var ____trig = 0;
    if (is_string(arg0))
    {
        with (obj_trigger)
        {
            if (extflag == arg0)
            {
                if (place_meeting(x, y, arg1))
                    ____trig++;
            }
        }
    }
    return ____trig;
}
