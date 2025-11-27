if (open_fence)
{
    open_fence = false;
    if (i_ex(obj_noellehouse_fence))
    {
        with (obj_noellehouse_fence)
            open_fence = true;
    }
}
if (con == 0 && obj_mainchara.x <= 322)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
}
if (con == 2)
{
    con = 3;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    no = actor_count + 1;
    no_actor = instance_create(70, 123, obj_actor);
    scr_actor_setup(no, no_actor, "noelle");
    no_actor.sprite_index = spr_noelle_walk_left_lw;
    c_sel(kr);
    c_walkdirect(302, 132, 30);
    c_delayfacing(31, "l");
    c_sel(su);
    c_walkdirect(325, 126, 30);
    c_delayfacing(31, "l");
    c_pannable(1);
    c_pan(110, 0, 30);
    c_wait(30);
    c_msgside("top");
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* Alright^1, we made it./%", "obj_ch4_PDC07_slash_Step_0_gml_58_0");
    c_talk_wait();
    c_sel(su);
    c_walkdirect_wait(270, 126, 20);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* Now where the hell's Noelle?/%", "obj_ch4_PDC07_slash_Step_0_gml_66_0");
    c_talk_wait();
    c_wait(90);
    c_facing("d");
    c_wait(5);
    var went_diner = scr_flag_get(701) > 0;
    if (went_diner)
    {
        c_speaker("susie");
        c_msgsetloc(0, "\\E4* ..^1. damn^1, I'm getting bored./%", "obj_ch4_PDC07_slash_Step_0_gml_79_0");
        c_talk_wait();
    }
    else
    {
        c_speaker("susie");
        c_msgsetloc(0, "\\E4* ..^1. ugh^1, I'm gonna get hungry waiting around./%", "obj_ch4_PDC07_slash_Step_0_gml_84_0");
        c_talk_wait();
    }
    c_sel(su);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\EA* Kris^1, got any snacks?/%", "obj_ch4_PDC07_slash_Step_0_gml_93_0");
    c_talk_wait();
    c_wait(15);
    c_sel(kr);
    c_visible(0);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_kris_flower_take);
    c_imageindex(1);
    c_wait(15);
    c_imagespeed(0.2);
    c_wait(30);
    c_imagespeed(0);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* ..^1. that works I guess./%", "obj_ch4_PDC07_slash_Step_0_gml_112_0");
    c_talk_wait();
    c_sel(no);
    c_walkdirect_wait(134, 123, 30);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E4* Susie^1, Kris^1! Hi!!/%", "obj_ch4_PDC07_slash_Step_0_gml_120_0");
    c_talk_wait();
    c_var_instance(id, "open_fence", true);
    c_wait(10);
    c_sel(no);
    c_walkdirect_wait(241, 123, 30);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E8* Sorry I'm late...^1!  I just had to -/%", "obj_ch4_PDC07_slash_Step_0_gml_132_0");
    c_talk_wait();
    c_sel(kr);
    c_visible(1);
    c_sel(su);
    c_sprite(spr_susie_flower_left);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Yeah?/%", "obj_ch4_PDC07_slash_Step_0_gml_144_0");
    c_talk_wait();
    c_sel(no);
    c_autowalk(0);
    c_walk_wait("l", 2, 3);
    c_sprite(spr_noelle_surprise_blush);
    c_emote("!", 30);
    c_wait(30);
    c_autowalk(1);
    c_speaker("noelle");
    c_msgsetloc(0, "\\EP* Um^1, is that a..^1. a rose?/", "obj_ch4_PDC07_slash_Step_0_gml_157_0");
    c_facenext("susie", "7");
    c_msgnextloc("\\E7* This? Oh^1, yeah^1, sorry./%", "obj_ch4_PDC07_slash_Step_0_gml_159_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_flower_eat_throw);
    c_imagespeed(0.2);
    c_wait(18);
    c_soundplay(snd_swallow);
    c_wait(15);
    c_var_instance(stem_marker, "visible", 1);
    c_var_lerp_instance(stem_marker, "x", stem_marker.x, stem_marker.x + 20, 10);
    c_var_lerp_instance(stem_marker, "y", stem_marker.y, stem_marker.y + 20, 10);
    c_wait(10);
    c_sel(su);
    c_imagespeed(0);
    c_autowalk(1);
    c_facing("l");
    c_wait(12);
    c_var_instance(stem_marker, "image_speed", 0);
    c_var_instance(stem_marker, "image_index", 1);
    c_wait(15);
    c_sel(no);
    c_sprite(spr_noelle_disappointed);
    c_speaker("noelle");
    c_msgsetloc(0, "\\EG* .../", "obj_ch4_PDC07_slash_Step_0_gml_188_0");
    c_facenext("susie", 6);
    c_msgnextloc("\\E6* Oh shoot^1, did you want some?/%", "obj_ch4_PDC07_slash_Step_0_gml_190_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_walk_down_lw_unhappy);
    c_waittalk();
    c_sel(su);
    c_walkdirect_wait(270, 135, 5);
    c_walkdirect_wait(285, 135, 8);
    c_sprite(spr_susie_pick_up);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* I can pick up the stem if you -/%", "obj_ch4_PDC07_slash_Step_0_gml_206_0");
    c_talk_wait();
    c_sel(no);
    c_walkdirect(70, 123, 30);
    var small_talk = stringsetloc("What? What? What? What?", "obj_ch4_PDC07_slash_Step_0_gml_214_0");
    scr_smallface(1, "noelle", 18, 350, 230, small_talk);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E8* No^1, it's fine^1! This way^1!\\f1/%", "obj_ch4_PDC07_slash_Step_0_gml_217_0");
    c_talk_wait();
    c_wait(5);
    c_sel(su);
    c_sprite(spr_susie_walk_left_lw_unhappy);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* ..^1. Okay^1, whatever./%", "obj_ch4_PDC07_slash_Step_0_gml_226_0");
    c_talk_wait();
    c_sel(su);
    c_walkdirect(325, 126, 15);
    c_delayfacing(16, "l");
    c_panobj(kr_actor, 15);
    c_wait(16);
    c_pannable(0);
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
    global.plot = 45;
    with (stem_marker)
        depth = 940000;
    con = 99;
}
