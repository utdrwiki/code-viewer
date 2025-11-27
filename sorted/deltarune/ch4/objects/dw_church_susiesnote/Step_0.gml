if (con == 0)
{
    var targx = (camerax() + 320) - sprite_get_width(spr_dw_church_susiesnote);
    var targy = (cameray() + 240) - sprite_get_height(spr_dw_church_susiesnote) - 80;
    scr_speaker("no_name");
    msgsetloc(0, "* (It's a bit hard to read the characters^1, but it looks like this...)/", "obj_dw_church_susiesnote_slash_Step_0_gml_17_0");
    msgnextloc("", "obj_dw_church_susiesnote_slash_Step_0_gml_18_0");
    d_make();
    global.interact = 1;
    with (obj_darkcontroller)
        charcon = 0;
    global.menuno = -1;
    charcon = 0;
    con = 1;
}
if (con == 1)
{
    if (scr_getmsgno() == 1)
    {
        depth = 0;
        drawnote = 0;
        con = 2;
        buffer = 2;
    }
}
if (con == 2)
{
    buffer--;
    if ((button1_p() || button3_h()) && !buffer)
    {
        drawnote++;
        buffer = 2;
        if (drawnote >= 3)
        {
            con = 3;
            drawnote = -1;
            k_d();
            instance_destroy();
            global.interact = 0;
        }
    }
}
