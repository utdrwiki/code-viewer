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
