if (con == 0 && obj_mainchara.x >= 1260 && obj_mainchara.y >= 1050 && global.interact == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    var sus_x = obj_caterpillarchara.x;
    var sus_y = obj_caterpillarchara.y;
    scr_getchar(3);
    scr_makecaterpillar(obj_mainchara.x + 40, cameray() - 100, 3, 1);
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            visible = 0;
    }
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    c_sel(ra);
    c_setxy(camerax() - 80, obj_mainchara.y - 10);
    c_var_instance(id, "noskip", true);
    c_msgside("top");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EP* W-wait for me!/%", "obj_ch3_PGS01B_slash_Step_0_gml_39_0");
    c_talk_wait();
    c_var_instance(id, "noskip", false);
    c_sel(kr);
    c_facing("l");
    c_sel(su);
    c_emote("!", 30);
    c_facing("l");
    c_pannable(1);
    c_pan(scr_even(kr_actor.x - 480), cameray(), 60);
    c_sel(ra);
    c_walkdirect(camerax(), scr_even(obj_mainchara.y) - 10, 60);
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Ralsei!/%", "obj_ch3_PGS01B_slash_Step_0_gml_60_0");
    c_talk_wait();
    c_sel(su);
    c_walkdirect_wait(scr_even(camerax() + 80), scr_even(su_actor.y), 20);
    c_wait(30);
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_glasses_adjust);
    c_halt();
    c_wait(5);
    c_imageindex(1);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ed* I felt a dark presence and hurried here.../", "obj_ch3_PGS01B_slash_Step_0_gml_77_0");
    c_msgnextloc("\\EE* If we keep going^1, the Dark Fountain should be.../%", "obj_ch3_PGS01B_slash_Step_0_gml_79_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_autowalk(1);
    c_facing("r");
    c_wait_talk();
    c_sel(su);
    c_walkdirect(camerax() + 60, su_actor.y, 5);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Hey^1, Ralsei!/", "obj_ch3_PGS01B_slash_Step_0_gml_95_0");
    c_msgnextloc("\\E9* You're not gonna BELIEVE what I did after our adventure yesterday!/", "obj_ch3_PGS01B_slash_Step_0_gml_96_0");
    c_msgnextloc("\\E2* After we saved the WORLD^1, I went over Kris's.../", "obj_ch3_PGS01B_slash_Step_0_gml_100_0");
    c_msgnextloc("\\E9* Almost baked an ENTIRE pie.../", "obj_ch3_PGS01B_slash_Step_0_gml_104_0");
    c_msgnextloc("\\E2* And then marathoned movies ALL NIGHT!/", "obj_ch3_PGS01B_slash_Step_0_gml_108_0");
    c_facenext("ralsei", "H");
    c_msgnextloc("\\EH* Aww^1, Susie^1! It sounds like you had a wonderful time!/%", "obj_ch3_PGS01B_slash_Step_0_gml_113_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_pose);
    c_wait_box(2);
    c_sel(su);
    c_facing("l");
    c_wait_box(3);
    c_sel(su);
    c_facing("r");
    c_wait_box(4);
    c_sel(su);
    c_sprite(spr_susie_pose);
    c_wait_box(5);
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_laugh);
    c_imagespeed(0.2);
    c_addxy(0, 6);
    c_wait_talk();
    c_sel(su);
    c_sprite(spr_susie_walk_back_arm);
    c_sel(ra);
    c_facing("r");
    c_halt();
    c_addxy(0, -6);
    c_speaker("susie");
    c_msgsetloc(0, "\\EQ* Yeah^1, it wasn't AWFUL^1, I guess.../", "obj_ch3_PGS01B_slash_Step_0_gml_154_0");
    c_facenext("ralsei", 2);
    c_msgnextloc("\\E2* I want to hear all about it.../", "obj_ch3_PGS01B_slash_Step_0_gml_156_0");
    c_msgnextloc("\\EQ* Um^1, let's just get going^1, first!/", "obj_ch3_PGS01B_slash_Step_0_gml_157_0");
    c_facenext("susie", 6);
    c_msgnextloc("\\E6* Oh^1, uh^1, yeah!/%", "obj_ch3_PGS01B_slash_Step_0_gml_159_0");
    c_talk();
    c_wait_box(3);
    c_sel(ra);
    c_facing("d");
    c_wait_box(5);
    c_sel(ra);
    c_facing("r");
    c_sel(su);
    c_facing("l");
    c_wait_talk();
    c_sel(ra);
    c_autowalk(1);
    c_walkdirect(obj_mainchara.x - 120, obj_mainchara.y - 10, 30);
    c_sel(su);
    c_autowalk(1);
    c_walkdirect_wait(obj_mainchara.x - 60, su_actor.y, 20);
    c_wait(5);
    c_pannable(1);
    c_panobj(kr_actor, 30);
    c_wait(35);
    c_soundplay(snd_swing);
    c_sel(kr);
    c_spin(2);
    c_sel(su);
    c_spin(2);
    c_sel(ra);
    c_spin(2);
    c_wait(16);
    c_soundplay(snd_bell);
    c_sel(kr);
    c_sprite(spr_kris_pose);
    c_addxy(-2, -2);
    c_spin(0);
    c_sel(su);
    c_sprite(spr_susie_pose);
    c_addxy(2, 2);
    c_spin(0);
    c_sel(ra);
    c_sprite(spr_ralsei_pose);
    c_addxy(-10, 0);
    c_spin(0);
    c_wait(15);
    c_sel(ra);
    c_addxy(10, 0);
    c_facing("r");
    c_sel(kr);
    c_addxy(2, 2);
    c_facing("d");
    c_sel(su);
    c_addxy(-2, -2);
    c_facing("r");
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 20;
    con = 99;
}
if (noskip)
{
    with (obj_writer)
        skippable = 0;
}
