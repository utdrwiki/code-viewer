if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    alarm[0] = 30;
    global.interact = 1;
    global.facing = 0;
    if (array_length(global.currentsong) <= 2 || !snd_is_playing(global.currentsong[3]))
    {
        global.currentsong[2] = snd_init("raining_in_church2.ogg");
        global.currentsong[3] = mus_loop(global.currentsong[2]);
        mus_volume(global.currentsong[3], 0, 0);
        mus_volume(global.currentsong[3], 0.75, 30);
    }
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_setxy(296, 119);
    c_sprite(spr_kris_kneel);
    c_sel(su);
    c_facing("susieunhappy");
    c_setxy(326, 110);
    c_sprite(spr_susie_kneel);
    c_var_lerp_instance(whiteall, "image_alpha", 1, 0, 60);
    c_wait(90);
    c_sel(kr);
    c_facing("d");
    c_sel(su);
    c_facing("d");
    c_addxy(0, 2);
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* .../%", "obj_ch4_DCA13_slash_Step_0_gml_78_0");
    c_talk_wait();
    c_sel(kr);
    c_facing("r");
    c_sel(su);
    c_facing("l");
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\E1* Guess the sun went down^1, huh.../%", "obj_ch4_DCA13_slash_Step_0_gml_91_0");
    c_talk_wait();
    c_sel(su);
    c_facing("u");
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* .../", "obj_ch4_DCA13_slash_Step_0_gml_101_0");
    c_msgnextloc("\\EZ* Damn^1, Kris^1! Look under the door!/", "obj_ch4_DCA13_slash_Step_0_gml_102_0");
    c_msgnextloc("\\Ee* That weird smoke..^1. no way.../", "obj_ch4_DCA13_slash_Step_0_gml_103_0");
    c_msgnextloc("\\Eb* You don't think..^1. there's another Dark World!?/", "obj_ch4_DCA13_slash_Step_0_gml_104_0");
    c_msgnextloc("\\Ec* Damnit^1, that means the Knight is still.../%", "obj_ch4_DCA13_slash_Step_0_gml_105_0");
    c_talk();
    c_wait_box(1);
    c_sel(kr);
    c_facing("u");
    c_sel(su);
    c_walkdirect(326, 92, 6);
    c_wait_box(2);
    c_sel(kr);
    c_walkdirect(296, 99, 12);
    c_wait_box(3);
    c_sel(su);
    c_facing("l");
    c_wait_talk();
    c_sel(su);
    c_facing("u");
    c_walkdirect_wait(307, 65, 12);
    c_snd_play(snd_noise);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* It's locked.../", "obj_ch4_DCA13_slash_Step_0_gml_133_0");
    c_msgnextloc("\\Ec* Ugh^1, it's a stupid numbers lock again!/%", "obj_ch4_DCA13_slash_Step_0_gml_134_0");
    c_talk_wait();
    c_sel(su);
    c_autowalk(0);
    c_halt();
    c_sprite(spr_susie_kick_up);
    c_halt();
    c_wait(6);
    c_var_lerp_to("image_index", 4, 8);
    c_wait(6);
    c_soundplay(snd_impact);
    c_shakex(8, 2, 1);
    c_wait(30);
    c_sel(su);
    c_autowalk(1);
    c_facing("u");
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* ..^1. too hard to break^1, either./", "obj_ch4_DCA13_slash_Step_0_gml_157_0");
    c_msgnextloc("\\ED* ..^1. Guess we.../", "obj_ch4_DCA13_slash_Step_0_gml_158_0");
    c_msgnextloc("\\ED* ..^1. Guess we can try looking for the combination.../", "obj_ch4_DCA13_slash_Step_0_gml_159_0");
    c_msgnextloc("\\ED* C'mon./%", "obj_ch4_DCA13_slash_Step_0_gml_160_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_look_down_walk);
    c_wait_talk();
    c_pannable(1);
    c_panobj(kr_actor, 20);
    c_wait(21);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    con = 5;
    global.facing = 0;
    global.interact = 0;
    if (!snd_is_playing(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init("church_lw_night.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
    }
}
if (con == 5)
{
    if (i_ex(obj_mainchara))
    {
        if (obj_mainchara.x <= 220 || obj_mainchara.x >= 395)
            con = 10;
    }
}
if (con == 10 && !d_ex())
{
    con = 20;
    global.interact = 1;
    scr_speaker("susie");
    msgsetloc(0, "\\E6* Hey..^1. shouldn't the old man be around here?/", "obj_ch4_DCA13_slash_Step_0_gml_224_0");
    msgnextloc("\\E0* We gotta get him out of here.../", "obj_ch4_DCA13_slash_Step_0_gml_225_0");
    msgnextloc("\\E2* Plus^1, he probably knows where a code is^1, right?/%", "obj_ch4_DCA13_slash_Step_0_gml_226_0");
    var d = d_make();
}
if (con == 20 && !d_ex())
{
    global.interact = 0;
    global.facing = 0;
    con = -1;
    global.plot = 210;
}
