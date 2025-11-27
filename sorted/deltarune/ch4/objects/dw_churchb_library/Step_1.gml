if (flooractive >= 3)
    exit;
with (obj_dw_church_remotepianomove)
{
    if (engaged && !other.piano_was_engaged)
    {
        with (obj_solid_temp)
        {
            if (extflag == "FLOOR1TEMP")
                active = 1;
            else
                active = 0;
        }
    }
    else if (!engaged && other.piano_was_engaged)
    {
        with (obj_solid_temp)
        {
            if (extflag == "FLOOR1")
                active = 1;
            else
                active = 0;
        }
    }
    other.piano_was_engaged = engaged;
}
if (flooractive == wasactive)
    exit;
if (flooractive == 1)
{
    with (obj_solid_temp)
    {
        if (extflag == "FLOOR1")
            active = 1;
        else
            active = 0;
    }
}
if (flooractive == 2)
{
    with (obj_solid_temp)
    {
        if (extflag == "FLOOR2")
            active = 1;
        else
            active = 0;
    }
}
wasactive = flooractive;
