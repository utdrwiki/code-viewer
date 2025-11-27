y = ystart - 12 - (sin(siner / 15) * 12);
x = xstart + (sin(siner / 45) * 6);
scr_depth();
if (!init)
{
    if (global.plot <= 242)
    {
        instance_destroy();
        exit;
    }
    else
    {
        var pos = scr_genmarker("wingsolid");
        trig = instance_create(pos.x, pos.y, obj_trigger_interact);
        scr_sizeexact(pos.sprite_width, pos.sprite_height, trig);
        trig.issolid = true;
        trig.talked = 0;
        trig.strict = true;
    }
    init = true;
}
if (con == 0)
{
    if (trig.myinteract != 0)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* cleave your own path./", "obj_dw_church_bellhall_bookroom_winglade_slash_Step_0_gml_35_0");
        msgnextloc("* cut your own way./", "obj_dw_church_bellhall_bookroom_winglade_slash_Step_0_gml_36_0");
        msgnextloc("* me? my way is in your way./%", "obj_dw_church_bellhall_bookroom_winglade_slash_Step_0_gml_37_0");
        if (talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* it's your way or the high way./%", "obj_dw_church_bellhall_bookroom_winglade_slash_Step_0_gml_42_0");
        }
        d_make();
        con = 1;
        talked++;
    }
}
if (con == 1 && !d_ex())
{
    con = 0;
    global.interact = 0;
    trig.myinteract = 0;
}
