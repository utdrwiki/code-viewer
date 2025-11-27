if (con == 0 && global.interact == 0)
{
    var triggered = false;
    with (obj_trigger)
    {
        if (place_meeting(x, y, obj_mainchara))
            triggered = true;
    }
    if (triggered)
    {
        con = 1;
        alarm[0] = 1;
        global.interact = 1;
        susie_marker = scr_marker(298, 323, spr_susie_walk_up_lw);
        susie_marker.depth = 5000;
        susie_marker.visible = 0;
    }
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 2;
    scr_caterpillar_facing(2);
    c_pannable(1);
    c_pan(151, 227, 30);
    c_sel(kr);
    c_walkdirect(274, 330, 30);
    c_delayfacing(31, "u");
    c_sel(su);
    c_walkdirect(298, 323, 30);
    c_delayfacing(31, "u");
    c_wait(40);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_head_scratch);
    c_imagespeed(0.2);
    c_addxy(-2, -1);
    if (scr_flag_get(1555) == 1)
    {
        c_speaker("susie");
        c_msgsetloc(0, "\\E0* Well^1, let's^1, uh..^1. ask your mom for the key^1, I guess.../", "obj_ch4_PDC16_slash_Step_0_gml_51_0");
        c_msgnextloc("\\ED* Hope she doesn't mind us ruining choir practice./%", "obj_ch4_PDC16_slash_Step_0_gml_52_0");
        c_talk();
    }
    else
    {
        c_speaker("susie");
        c_msgsetloc(0, "\\E0* Guess if it's raining^1, we could wait out in here.../", "obj_ch4_PDC16_slash_Step_0_gml_71_0");
        c_msgnextloc("\\E1* ..^1. until your mom finishes choir practice?/", "obj_ch4_PDC16_slash_Step_0_gml_72_0");
        c_msgnextloc("\\ED* Y'know. Long as us being there doesn't ruin anything./%", "obj_ch4_PDC16_slash_Step_0_gml_73_0");
        c_talk_wait();
    }
    c_wait_box(1);
    c_sel(su);
    c_facing("u");
    c_halt();
    c_addxy(2, 1);
    c_wait_talk();
    c_sel(su);
    c_imagespeed(0.2);
    c_imageindex(1);
    c_walkdirect_wait(286, 290, 60);
    c_halt();
    c_wait(15);
    c_sprite(spr_susie_door_interactions);
    c_wait(30);
    c_imageindex(1);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* You'll^1, uh^1, get her^1, right...?/%", "obj_ch4_PDC16_slash_Step_0_gml_75_0");
    c_talk_wait();
    c_wait(30);
    c_waitcustom();
}
if (con == 3 && customcon == 1 && !d_ex())
{
    con = 4;
    global.currentsong[0] = snd_init("wind_highplace.ogg");
    global.currentsong[1] = mus_loop(global.currentsong[0]);
    mus_volume(global.currentsong[1], 0, 0);
    mus_volume(global.currentsong[1], 1, 30);
    snd_pitch_time(global.currentsong[1], 0.6, 0);
    snd_pitch_time(global.currentsong[1], 1.5, 30);
}
if (con == 4 && customcon == 1 && !d_ex())
{
    con = 5;
    customcon = 0;
    c_waitcustom_end();
    c_var_instance(dark_door, "crack_door", true);
    c_var_instance(vfx, "bg_active", true);
    c_var_instance(vfx, "window_active", true);
    c_wait(60);
    c_sel(su);
    c_emote("!", 30);
    c_imageindex(0);
    c_wait(30);
    c_mus("free_all");
    c_sel(su);
    c_walkdirect(286, 286, 6);
    c_wait(5);
    c_snd_play_x(snd_doorclose, 0.7, 1.2);
    c_var_instance(dark_door, "close_door", true);
    c_var_instance(vfx, "bg_active", false);
    c_imageindex(2);
    c_wait(1);
    c_shake();
    c_wait(90);
    c_mus2("initloop", "creepydoor.ogg", 0);
    c_imageindex(3);
    c_var_instance(id, "slow_writer", true);
    c_speaker("susie");
    c_msgsetloc(0, "\\ET* Kris..^1. hey^1, Kris./", "obj_ch4_PDC16_slash_Step_0_gml_162_0");
    c_msgnextloc("\\EU* I don't think^1&they're having^1&choir practice./", "obj_ch4_PDC16_slash_Step_0_gml_163_0");
    c_msgnextloc("\\EV* .../%", "obj_ch4_PDC16_slash_Step_0_gml_164_0");
    c_talk_wait();
    c_var_instance(id, "slow_writer", false);
    c_sel(su);
    c_sprite(spr_susie_walk_up_lw);
    c_imagespeed(0.2);
    c_walkdirect_wait(298, 310, 30);
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\EX* That goddamn Knight.../", "obj_ch4_PDC16_slash_Step_0_gml_185_0");
    c_msgnextloc("\\EX* Making one right where everyone can see.../%", "obj_ch4_PDC16_slash_Step_0_gml_186_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_head_down);
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* Kris. Let's think logically^1, right.../", "obj_ch4_PDC16_slash_Step_0_gml_195_0");
    c_msgnextloc("\\EV* There's no way..^1. they can get out of there.../", "obj_ch4_PDC16_slash_Step_0_gml_196_0");
    c_msgnextloc("\\EV* ..^1. without us seeing them./", "obj_ch4_PDC16_slash_Step_0_gml_197_0");
    c_msgnextloc("\\EW* If we just wait here/", "obj_ch4_PDC16_slash_Step_0_gml_198_0");
    c_msgnextloc("\\EW* ..^1. we'd be able to catch them leaving^1, right?/%", "obj_ch4_PDC16_slash_Step_0_gml_199_0");
    c_talk();
    c_wait_box(1);
    c_sprite(spr_susie_head_down_right_more);
    c_wait_box(3);
    c_sprite(spr_susie_head_down);
    c_wait_box(4);
    c_sprite(spr_susie_walk_up_lw);
    c_wait_talk();
    c_wait(5);
    c_msc(1429);
    c_talk_wait();
    c_waitcustom();
}
if (con == 10 && customcon == 1 && !d_ex())
{
    con = 30;
    customcon = 0;
    c_waitcustom_end();
    c_wait(5);
    c_sprite(spr_susie_head_down);
    c_speaker("susie");
    c_msgsetloc(0, "\\EW* Heheh.../", "obj_ch4_PDC16_slash_Step_0_gml_234_0");
    c_msgnextloc("\\EY* You're DAMN RIGHT we aren't!/%", "obj_ch4_PDC16_slash_Step_0_gml_235_0");
    c_talk();
    c_wait_box(1);
    c_sprite(spr_susie_walk_up_lw);
    c_wait_talk();
    c_sel(su);
    c_autowalk(1);
    c_walk("u", 2, 4);
    c_speaker("susie");
    c_msgsetloc(0, "\\EY* Hey^1, you think you can scare US!?/", "obj_ch4_PDC16_slash_Step_0_gml_248_0");
    c_msgnextloc("\\E2* We'll show you who REALLY rules the dark!/", "obj_ch4_PDC16_slash_Step_0_gml_249_0");
    c_msgnextloc("\\E2* C'mon^1, Kris...!/%", "obj_ch4_PDC16_slash_Step_0_gml_250_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_shakeobj();
    c_wait_talk();
    c_waitcustom();
}
if (con == 20 && customcon == 1 && !d_ex())
{
    con = 30;
    customcon = 0;
    c_waitcustom_end();
    c_wait(5);
    c_sprite(spr_susie_head_down);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* ..^1. damn it^1, you're right./", "obj_ch4_PDC16_slash_Step_0_gml_275_0");
    c_msgnextloc("\\EV* If we spend all day waiting around.../", "obj_ch4_PDC16_slash_Step_0_gml_276_0");
    c_msgnextloc("\\EV* We have no idea what they might do to her.../%", "obj_ch4_PDC16_slash_Step_0_gml_277_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_head_down_right_more);
    c_wait_box(2);
    c_sprite(spr_susie_walk_up_lw);
    c_wait_talk();
    c_sel(su);
    c_autowalk(1);
    c_walk("u", 2, 4);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Alright^1! Kris^1, let's go!/", "obj_ch4_PDC16_slash_Step_0_gml_296_0");
    c_msgnextloc("\\El* The details..^1. we'll figure 'em out later!/", "obj_ch4_PDC16_slash_Step_0_gml_297_0");
    c_msgnextloc("\\E2* C'mon!/%", "obj_ch4_PDC16_slash_Step_0_gml_298_0");
    c_talk_wait();
    c_waitcustom();
}
if (con == 30 && customcon == 1 && !d_ex())
{
    con = 40;
    customcon = 0;
    c_waitcustom_end();
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_walk_up_lw);
    c_imageindex(1);
    c_imagespeed(0.2);
    c_walkdirect_wait(287, 286, 10);
    c_halt();
    c_sprite(spr_susie_door_interactions);
    c_imageindex(5);
    c_lerp_var_instance(su_actor, "image_index", 5, 8, 12);
    c_wait_if(su_actor, "image_index", ">=", 6);
    c_mus("free_all");
    c_mus2("initloop", "wind_highplace.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("pitch", 0.6, 0);
    c_mus2("volume", 1, 150);
    c_mus2("pitch", 1.5, 150);
    c_var_instance(dark_door, "open_door", true);
    c_var_instance(vfx, "bg_active", true);
    c_shake();
    c_wait(16);
    c_sel(su);
    c_autodepth(0);
    c_depth(79990);
    c_sprite(spr_susie_walk_up_lw);
    c_imagespeed(0.2);
    c_walkdirect(287, 273, 10);
    c_delaycmd4(6, "var", id, "susie_hide", true);
    c_sel(kr);
    c_autodepth(0);
    c_depth(79980);
    c_walkdirect(288, 275, 30);
    c_wait_if(kr_actor, "y", "<=", 288);
    c_var_instance(id, "kris_hide", true);
    c_wait(30);
    c_sel(su);
    c_visible(0);
    c_sel(kr);
    c_visible(0);
    c_mus("free_all");
    c_snd_play(snd_locker);
    c_var_instance(dark_door, "close_door", true);
    c_var_instance(vfx, "bg_active", false);
    c_shake();
    c_wait(30);
    c_customfunc(function()
    {
        with (obj_border_controller)
            hide_border(0.015);
    });
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 60);
    c_wait(60);
    c_actortokris();
    c_terminatekillactors();
}
if (con == 40 && !i_ex(obj_cutscene_master))
{
    with (susie_marker)
        instance_destroy();
    global.plot = 105;
    con = 99;
    with (obj_mainchara)
        visible = 0;
    instance_create(x, y, obj_dw_transition);
    with (obj_lw_rain_effect)
        wrap_up = true;
    if (scr_havechar(2))
    {
        with (su_actor)
            instance_destroy();
    }
    with (obj_dw_transition)
    {
        nextroom = 108;
        quick_mode = 0;
        skiprunback = 1;
        finaly = cameray() + 100;
        if (!scr_havechar(2))
        {
            kris_x = obj_mainchara.x;
            kris_y = obj_mainchara.y;
            kris_only = 1;
        }
    }
}
if (enter_dark)
{
    if (dark_con == 0)
    {
        with (obj_mainchara)
            visible = 0;
        instance_create(x, y, obj_dw_transition);
        with (obj_lw_rain_effect)
            wrap_up = true;
        if (scr_havechar(2))
        {
            with (su_actor)
                instance_destroy();
        }
        with (obj_dw_transition)
        {
            nextroom = 108;
            quick_mode = 0;
            finaly = cameray() + 100;
            if (!scr_havechar(2))
            {
                kris_x = obj_mainchara.x;
                kris_y = obj_mainchara.y;
                kris_only = 1;
            }
        }
        dark_con = 99;
    }
}
if (slow_writer && i_ex(obj_writer))
{
    with (obj_writer)
    {
        rate = 2;
        skippable = 0;
    }
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
if (kris_hide)
{
    kris_shadow = clamp(kris_shadow + 0.2, 0, 1);
    var shadow = kris_shadow;
    with (kr_actor)
        color_blend = merge_color(c_white, make_color_hsv(0, 0, 0), shadow);
    if (kris_shadow >= 1)
        kris_hide = false;
}
