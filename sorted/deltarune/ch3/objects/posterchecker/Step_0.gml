if (con == 0)
{
    for (var i = 0; i < array_length(trig); i++)
    {
        if (i_ex(trig[i]))
        {
            if (trig[i].myinteract == 3)
            {
                trig[i].myinteract = 0;
                global.interact = 1;
                con = 1;
                activetrig = trig[i];
            }
        }
    }
}
if (con == 1)
{
    scr_speaker("no_name");
    if (activetrig.extflag == "large01_b" || activetrig.extflag == "large01_d" || activetrig.extflag == "intro_b")
        msgsetloc(0, "* (It's a poster. It has word on it.)/%", "obj_posterchecker_slash_Step_0_gml_72_0");
    else
        msgsetloc(0, "* (It's a poster. It doesn't have any words on it.)/%", "obj_posterchecker_slash_Step_0_gml_76_0");
    d_make();
    con = 2;
}
if (con == 2 && !d_ex())
{
    con = 0;
    global.interact = 0;
}
