with (obj_climb_susie)
{
    if (waiteventid == other.waitevent)
        waiteventid = 0;
}
if (reach > 0)
{
    if (i_ex(obj_dw_churchb_rotatingtower))
    {
        with (obj_dw_churchb_rotatingtower)
        {
            monologuecon = other.reach - 1;
            event_user(10);
        }
    }
    if (i_ex(obj_dw_churchb_darkclimb))
    {
        with (obj_dw_churchb_darkclimb)
        {
            monologuecon = other.reach - 1;
            event_user(10);
        }
    }
    if (i_ex(obj_dw_churchc_titanclimb2))
    {
        with (obj_dw_churchc_titanclimb2)
        {
            monologuecon = other.reach - 1;
            event_user(10);
        }
    }
}
if (i_ex(obj_dw_churchb_darkclimb))
{
    with (obj_dw_churchb_darkclimb)
    {
        controlcon = other.waitevent;
        event_user(11);
    }
}
if (i_ex(obj_dw_churchc_titanclimb2))
{
    with (obj_dw_churchc_titanclimb2)
    {
        controlcon = other.waitevent;
        event_user(11);
    }
}
instance_destroy();
