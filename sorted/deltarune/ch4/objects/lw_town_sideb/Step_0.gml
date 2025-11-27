if (con < 0)
    exit;
if (con == 0 && global.interact == 0)
{
    var triggered = false;
    with (_trigger)
    {
        if (place_meeting(x, y, obj_mainchara))
            triggered = true;
    }
    if (triggered)
    {
        con = target_con;
        global.interact = 1;
        with (_trigger)
            instance_destroy();
    }
}
if (con == 10 && !d_ex())
{
    con = 50;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("d");
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* Damn..^1. that whole thing was a disaster^1, huh./", "obj_lw_town_sideb_slash_Step_0_gml_26_0");
    c_msgnextloc("\\EN* ..^1. and this is gonna sound dumb^1, but.../", "obj_lw_town_sideb_slash_Step_0_gml_27_0");
    c_msgnextloc("\\ED* ..^1. You know what else kinda bites?/", "obj_lw_town_sideb_slash_Step_0_gml_28_0");
    c_msgnextloc("\\ED* ..^1. didn't even get to..^1. hang out^1, really./", "obj_lw_town_sideb_slash_Step_0_gml_29_0");
    c_msgnextloc("\\EN* All three of us^1, I mean./%", "obj_lw_town_sideb_slash_Step_0_gml_30_0");
    c_talk();
    c_wait_box(1);
    c_sprite(spr_susie_look_down_walk);
    c_wait_box(2);
    c_sprite(spr_susie_walk_down_lw_unhappy);
    c_wait_box(3);
    c_sprite(spr_susie_look_down_left);
    c_wait_box(4);
    c_sprite(spr_susie_walk_down_lw_unhappy);
    c_wait_talk();
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 20 && !d_ex())
{
    con = 31;
    alarm[0] = 30;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(su);
    c_facing("susieunhappy");
    c_pannable(1);
    c_pan(camerax(), 70, 30);
    c_sel(kr);
    c_walkdirect(420, 204, 30);
    c_delayfacing(31, "u");
    c_sel(su);
    c_walkdirect_wait(416, 172, 30);
    c_facing("d");
    c_msgside("top");
    c_speaker("susie");
    c_msgsetloc(0, "\\E1* Y'know^1, Noelle..^1. said she wanted to talk to you./", "obj_lw_town_sideb_slash_Step_0_gml_92_0");
    c_msgnextloc("\\E0* But..^1. something..^1. about her look was kinda..^1. weird./", "obj_lw_town_sideb_slash_Step_0_gml_93_0");
    c_msgnextloc("\\ED* ..^1. Why/", "obj_lw_town_sideb_slash_Step_0_gml_94_0");
    c_msgnextloc("\\ET* ..^1. couldn't she just talk to you in front of me?/%", "obj_lw_town_sideb_slash_Step_0_gml_95_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_look_down_left);
    c_wait_box(2);
    c_sprite(spr_susie_look_down_left_eyes_closed);
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_look_down_left);
    c_wait_talk();
    c_delaycmd(31, "sprite", spr_susie_walk_down_lw_unhappy);
    c_waitcustom();
}
if (con == 32 && !d_ex() && customcon == 1)
{
    con = 34;
    alarm[0] = 30;
    mus_volume(global.currentsong[1], 0, 30);
}
if (con == 35 && !d_ex() && customcon == 1)
{
    con = 37;
    scr_speaker("susie");
    msgsetloc(0, "\\EU* What..^1. were you two talking about?/%", "obj_lw_town_sideb_slash_Step_0_gml_130_0");
    var d = d_make();
    d.side = 0;
    d.stay = 5;
}
if (con == 37 && !d_ex())
{
    con = -1;
    with (obj_lw_rain_effect)
        toggle_effect();
    audio_pause_sound(global.currentsong[3]);
    audio_pause_sound(global.currentsong[5]);
    susie_overlay = scr_marker(-10, -10, spr_pixel_white);
    with (susie_overlay)
    {
        image_xscale = 1000;
        image_yscale = 1000;
        image_blend = #EA79C8;
        image_alpha = 0.2;
        depth = 4900;
    }
    global.msc = 1419;
    scr_text(global.msc);
    var d = instance_create(0, 0, obj_lw_town_sideb_choicer);
}
if (con == 40 && customcon == 1)
{
    con = 50;
    customcon = 0;
    with (obj_lw_town_sideb_choicer)
        instance_destroy();
    with (obj_lw_rain_effect)
        toggle_effect();
    with (susie_overlay)
        instance_destroy();
    audio_resume_sound(global.currentsong[3]);
    audio_resume_sound(global.currentsong[5]);
    mus_volume(global.currentsong[1], 0.7, 1);
    c_waitcustom_end();
    c_sel(su);
    c_sprite(spr_susie_look_down_left_smile);
    c_speaker("susie");
    c_msgsetloc(0, "\\E9* It wasn't about me^1, right? Heheh.../", "obj_lw_town_sideb_slash_Step_0_gml_188_0");
    c_msgnextloc("\\EK* ..^1. what? Fine^1, I won't bring it up again.../%", "obj_lw_town_sideb_slash_Step_0_gml_189_0");
    c_talk();
    c_wait_box(1);
    c_sprite(spr_susie_walk_down_lw_unhappy);
    c_wait_talk();
    c_panobj(kr_actor, 15);
    c_wait(16);
    c_sel(kr);
    c_facing("d");
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 50 && !d_ex() && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    var dialogue_flag = dialogue_progress + 1;
    scr_flag_set(1528, dialogue_flag);
}
