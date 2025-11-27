if (con == 0)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "cutscene")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig)
        con = 1;
}
if (con == 1)
{
    global.interact = 1;
    if (scr_flag_get(203) == 1)
    {
    }
    d_make();
    con = 2;
}
if (con == 2 && !d_ex())
{
    global.interact = 0;
    global.plot = 130;
    con = 3;
}
