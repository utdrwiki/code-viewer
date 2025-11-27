if (con == 0 && global.interact == 0)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "decidedtocomeby")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig)
    {
        con = 1;
        global.interact = 1;
        with (gerson_npc)
            current_state = 5;
        scr_speaker("gerson");
        msgsetloc(0, "* Oh^1, so you decided to come by? Thanks!/", "obj_ch4_DCA07_slash_Step_0_gml_17_0");
        scr_anyface_next("susie", 20);
        msgnextloc("\\EK* (Dammit.)/%", "obj_ch4_DCA07_slash_Step_0_gml_19_0");
        d_make();
    }
}
if (con == 1 && !d_ex())
{
    con = 99;
    global.interact = 0;
    global.plot = 170;
    with (gerson_npc)
        current_state = 9;
    scr_tempsave();
}
if (knight_talk && !d_ex())
{
    if (knight_talk_con == 0)
    {
        knight_talk_con = 1;
        global.interact = 1;
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EJ* You^1, um..^1. haven't seen a shadowy figure^1, have you?/", "obj_ch4_DCA07_slash_Step_0_gml_65_0");
        c_facenext("gerson", 0);
        c_msgnextloc("* Hm..^1. now that you mention it..^1. Just before you came in.../", "obj_ch4_DCA07_slash_Step_0_gml_67_0");
        c_msgnextloc("* A figure with a sword flew in that door up there./%", "obj_ch4_DCA07_slash_Step_0_gml_68_0");
        c_talk();
        c_wait_box(2);
        c_var_instance(gerson_npc, "current_state", 2);
        c_wait_talk();
        c_pannable(1);
        c_pan(camerax(), 40, 90);
        c_wait(120);
        c_msgside("bottom");
        c_speaker("gerson");
        c_msgsetloc(0, "* But^1, it's locked with some contraption./", "obj_ch4_DCA07_slash_Step_0_gml_84_0");
        c_msgnextloc("* I reckon if you could get to the \\cYEast Belltower\\cW^1, you might be able to open it.../", "obj_ch4_DCA07_slash_Step_0_gml_85_0");
        c_msgnextloc("* But^1, scalin' the \\cYBelltower\\cW doesn't seem easy without tools./", "obj_ch4_DCA07_slash_Step_0_gml_86_0");
        c_msgnextloc("* Meanwhile^1, the \\cYNorthwest Library\\cW's got lots o' nice books./", "obj_ch4_DCA07_slash_Step_0_gml_87_0");
        c_msgnextloc("* Might help ya take your mind off it^1! It's that \\cYupper left\\cW door./", "obj_ch4_DCA07_slash_Step_0_gml_88_0");
        c_facenext("susie", "K");
        c_msgnextloc("\\EK* (Yeah^1, like we're gonna waste time wandering around there...)/%", "obj_ch4_DCA07_slash_Step_0_gml_90_0");
        c_talk_wait();
        c_panobj(kr_actor, 60);
        c_wait(65);
        c_var_instance(gerson_npc, "current_state", 9);
        c_pannable(0);
        c_actortokris();
        c_actortocaterpillar();
        c_terminatekillactors();
    }
    if (knight_talk_con == 1 && !i_ex(obj_cutscene_master))
    {
        knight_talk = false;
        knight_talk_con = 99;
        global.interact = 0;
    }
}
if (hide_elixir)
{
    if (hide_elixir_con == 0)
    {
        hide_elixir_con = 1;
        scr_flag_set(841, 2);
        with (item_markers[1])
            visible = false;
    }
    if (hide_elixir_con == 1 && !d_ex() && global.interact == 0)
    {
        hide_elixir_con = -1;
        hide_elixir = false;
        with (obj_readable_room1)
        {
            if (extflag == "elixir")
                instance_destroy();
        }
    }
}
