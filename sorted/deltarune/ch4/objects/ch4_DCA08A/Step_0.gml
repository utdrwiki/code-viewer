if (con < 0)
    exit;
var diffroom = false;
var xoff = 0;
var yoff = 0;
if ((!diffroom && (con == 0 && obj_mainchara.y <= 230 && obj_mainchara.x <= 230)) || (diffroom && con == 0))
{
    con = 1;
    global.interact = 1;
    global.facing = 0;
}
if (con == 1)
{
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    con = 1.1;
    with (obj_roomglow)
        create_highlight(obj_actor);
}
if (con == 1.1)
{
    con = 2;
    debug_print("this");
    printval("version");
    c_pannable(1);
    c_pan(260, 80, 32);
    c_sel(kr);
    c_walkdirect(560, 318, 32);
    c_sel(su);
    c_walkdirect(544, 348, 24);
    c_sel(ra);
    c_walkdirect(566, 380, 24);
    c_wait(24);
    c_sel(su);
    c_walkdirect(502, 302, 16);
    c_sel(ra);
    c_walkdirect(602, 306, 16);
    c_wait(16);
    c_sel(su);
    c_facing("u");
    c_sel(ra);
    c_facing("u");
    if (version == 1)
    {
        c_wait(30);
        c_msgside("bottom");
        c_speaker("susie");
        c_msgsetloc(0, "\\E6* Looks kinda like..^1. notes?/", "obj_ch4_DCA08A_slash_Step_0_gml_70_0");
        c_msgnextloc("\\E1* Kris^1, maybe you can play 'em on a piano somewhere?/", "obj_ch4_DCA08A_slash_Step_0_gml_71_0");
        c_facenext("ralsei", "2");
        c_msgnextloc("\\E2* Good idea^1, Susie^1! But^1, doesn't the song look^1, um.../", "obj_ch4_DCA08A_slash_Step_0_gml_73_0");
        c_msgnextloc("\\EI* ..^1. a little unfinished?/", "obj_ch4_DCA08A_slash_Step_0_gml_74_0");
        c_facenext("susie", "6");
        c_msgnextloc("\\E6* ..^1. huh? Yeah^1, guess we gotta find the other half?/", "obj_ch4_DCA08A_slash_Step_0_gml_76_0");
        c_msgnextloc("\\E2* It's probably close. Let's go./%", "obj_ch4_DCA08A_slash_Step_0_gml_77_0");
        c_talk();
        c_wait_talk();
    }
    if (version == 2)
    {
        c_msgside("bottom");
        c_speaker("ralsei");
        c_msgsetloc(0, "\\E2* Oh^1, Kris^1! It's the second half of the melody!/", "obj_ch4_DCA08A_slash_Step_0_gml_87_0");
        c_msgnextloc("\\EI* Now^1, you just need to play it.../", "obj_ch4_DCA08A_slash_Step_0_gml_88_0");
        c_facenext("susie", "6");
        c_msgnextloc("\\E6* Yeah^1, unless there's^1, like^1, a third half./", "obj_ch4_DCA08A_slash_Step_0_gml_90_0");
        c_facenext("ralsei", "Q");
        c_msgnextloc("\\EQ* (Um... there isn't.)/%", "obj_ch4_DCA08A_slash_Step_0_gml_92_0");
        c_talk_wait();
    }
    c_wait(5);
    c_pannable(1);
    c_panobj(kr_actor, 20);
    c_wait(21);
    c_sel(kr);
    c_facing("d");
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 2 && !i_ex(cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    if (global.flag[850] == 0)
        scr_flag_set(850, 0.5);
    else if (global.flag[850] == 0.5)
        scr_flag_set(850, 1);
    con = 99;
    instance_destroy();
}
