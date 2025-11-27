if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    global.interact = 1;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
}
if (con == 1)
{
    con = 2;
    c_sel(ra);
    c_setxy(300, 500);
    c_sel(kr);
    c_autowalk(0);
    c_setxy(237, 311);
    c_sprite(spr_kris_dw_landed);
    c_addxy(0, -4);
    c_sel(su);
    c_autowalk(0);
    c_facing("susieunhappy");
    c_setxy(290, 295);
    c_sprite(spr_susie_dw_landed);
    c_var_lerp_instance(whiteall, "image_alpha", 1, 0, 60);
    c_wait(90);
    c_msgside("top");
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* W..^1. We did it.../", "obj_ch4_DCC02_slash_Step_0_gml_48_0");
    c_msgnextloc("\\EV* .../%", "obj_ch4_DCC02_slash_Step_0_gml_49_0");
    c_talk_wait();
    c_sel(kr);
    c_imageindex(1);
    c_wait(4);
    c_facing("d");
    c_halt();
    c_addxy(0, 4);
    c_wait(8);
    c_sel(su);
    c_imageindex(1);
    c_wait(4);
    c_facing("d");
    c_addxy(4, 0);
    c_halt();
    c_wait(30);
    c_sel(su);
    c_facing("l");
    c_sel(kr);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\E1* ..^1. hey Kris^1, what's the deal with that red heart thing...?/", "obj_ch4_DCC02_slash_Step_0_gml_78_0");
    c_msgnextloc("\\ED* Is that..^1. your.../%", "obj_ch4_DCC02_slash_Step_0_gml_79_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_look_down_left_dw);
    c_wait_talk();
    c_wait(60);
    c_sel(su);
    c_sprite(spr_susie_sheeh);
    c_addxy(0, 5);
    c_shakeobj();
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* W-wait a sec^1! The old man!/", "obj_ch4_DCC02_slash_Step_0_gml_100_0");
    c_msgnextloc("\\EZ* C'mon!^1! We..^1. we still gotta talk to him!/%", "obj_ch4_DCC02_slash_Step_0_gml_101_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_facing("l");
    c_addxy(0, -5);
    c_wait_talk();
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_run_up);
    c_imagespeed(0.4);
    c_walkdirect(292, 130, 20);
    c_delaycmd4(18, "var", id, "susie_hide", true);
    c_wait(6);
    c_sel(kr);
    c_facing("u");
    c_wait(60);
    c_wait_talk();
    c_wait(30);
    c_sel(su);
    c_visible(0);
    c_sel(kr);
    c_facing("d");
    c_speaker("ralsei");
    c_fefc(0, 0);
    c_msgsetloc(0, "* Kris!/%", "obj_ch4_DCC02_slash_Step_0_gml_140_0");
    c_talk_wait();
    c_sel(ra);
    c_walkdirect(304, 299, 40);
    c_delayfacing(41, "l");
    c_sel(kr);
    c_delayfacing(41, "r");
    c_wait(70);
    c_sel(ra);
    c_sprite(spr_ralsei_head_down_smile_left);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* Kris..^1. Kris^1, you're alright...!/", "obj_ch4_DCC02_slash_Step_0_gml_159_0");
    c_msgnextloc("\\E0* I can't believe..^1. it actually worked!/", "obj_ch4_DCC02_slash_Step_0_gml_160_0");
    c_msgnextloc("\\EB* We..^1. actually defeated a Titan...!/", "obj_ch4_DCC02_slash_Step_0_gml_161_0");
    c_msgnextloc("\\EI* If we can do that^1, then.../%", "obj_ch4_DCC02_slash_Step_0_gml_162_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_facing("l");
    c_wait_box(2);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_sad_subtle);
    c_wait_box(3);
    c_sel(ra);
    c_facing("l");
    c_wait_talk();
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_left);
    c_wait(30);
    c_sel(ra);
    c_sprite(spr_ralsei_turn_away_left);
    c_wait(30);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\El* Kris^1, w..^1. where's Susie?/%", "obj_ch4_DCC02_slash_Step_0_gml_223_0");
    c_talk_wait();
    c_sel(ra);
    c_imagespeed(0.2);
    c_walkdirect_wait(304, 299, 12);
    c_halt();
    c_wait(6);
    c_sprite(spr_ralsei_shocked_subtle_left);
    c_wait(60);
    c_facing("u");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Eg* SUSIE^1, WAIT!!/%", "obj_ch4_DCC02_slash_Step_0_gml_250_0");
    c_talk();
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_running_up);
    c_imagespeed(0.4);
    c_walkdirect(300, 130, 20);
    c_delaycmd4(17, "var", id, "ralsei_hide", true);
    c_delaycmd(30, "visible", 0);
    c_sel(kr);
    c_delayfacing(4, "u");
    c_wait(60);
    c_wait_talk();
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_terminatekillactors();
}
if (con == 2 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    scr_losechar();
    global.plot = 260;
    con = 99;
}
if (susie_hide)
{
    susie_shadow = clamp(susie_shadow + 0.2, 0, 1);
    var shadow = susie_shadow;
    with (su_actor)
        color_blend = merge_color(c_white, make_color_hsv(0, 0, 0), shadow);
    if (susie_shadow >= 1)
        susie_hide = false;
}
if (ralsei_hide)
{
    ralsei_shadow = clamp(ralsei_shadow + 0.2, 0, 1);
    var shadow = ralsei_shadow;
    with (ra_actor)
        color_blend = merge_color(c_white, make_color_hsv(0, 0, 0), shadow);
    if (ralsei_shadow >= 1)
        ralsei_hide = false;
}
