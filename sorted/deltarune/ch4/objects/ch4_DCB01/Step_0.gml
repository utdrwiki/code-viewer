if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_sprite(spr_kris_dw_landed);
    c_setxy(234, 196);
    c_sel(su);
    c_sprite(spr_susie_dw_landed);
    c_setxy(290, 184);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 90);
    c_wait(120);
    c_sel(su);
    c_facing("d");
    c_addxy(0, 1);
    c_sel(kr);
    c_facing("d");
    c_setxy(234, 201);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EN* I..^1. I actually did it./", "obj_ch4_DCB01_slash_Step_0_gml_57_0");
    c_msgnextloc("\\E9* Hey^1, Kris^1, I made a Dark Fountain!/%", "obj_ch4_DCB01_slash_Step_0_gml_58_0");
    c_talk();
    c_wait_box(1);
    c_sel(kr);
    c_facing("r");
    c_sel(su);
    c_walk("r", 6, 6);
    c_wait_talk();
    c_sel(su);
    c_facing("u");
    c_wait(12);
    c_facing("l");
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_walk_back_arm);
    c_flip("x");
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Pretty cool^1, right...? Heh./%", "obj_ch4_DCB01_slash_Step_0_gml_82_0");
    c_talk_wait();
    c_sel(su);
    c_facing("l");
    c_flip("x");
    c_speaker("susie");
    c_msgsetloc(0, "\\E9* Maybe I'll let you do it next time./%", "obj_ch4_DCB01_slash_Step_0_gml_90_0");
    c_talk_wait();
    c_sel(su);
    c_walk_wait("l", 3, 12);
    c_speaker("susie");
    c_msgsetloc(0, "\\EA* Let's go./%", "obj_ch4_DCB01_slash_Step_0_gml_97_0");
    c_talk_wait();
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 230;
    con = 99;
}
