with (obj_climb_susie)
{
    if (other.waitevent > 0)
        waiteventid = other.waitevent;
    if (other.forcejump > 0)
        forcejump = other.forcejump;
    if (other.reach)
        reachcon = other.reach;
    dir = other.image_index;
    if (other.waitevent == -99)
    {
        snd_play(snd_wing);
        instance_destroy();
    }
}
if (i_ex(obj_dw_churchb_darkclimb))
{
    with (obj_dw_churchb_darkclimb)
    {
        controlcon = -other.waitevent;
        event_user(11);
    }
}
if (i_ex(obj_dw_churchc_titanclimb2))
{
    with (obj_dw_churchc_titanclimb2)
    {
        controlcon = -other.waitevent;
        event_user(11);
    }
}
instance_destroy();
