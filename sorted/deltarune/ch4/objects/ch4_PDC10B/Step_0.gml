if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
}
if (con == 2)
{
    con = scr_sideb_active() ? 10 : 20;
    global.facing = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    kris_overlay.set_target(kr_actor);
    if (scr_sideb_active())
    {
        no = actor_count + 1;
        no_actor = instance_create(290, 440, obj_actor);
        scr_actor_setup(no, no_actor, "noelle");
        no_actor.sprite_index = spr_noelle_walk_right_lw;
        c_pannable(1);
        c_pan(360, cameray(), 1);
        c_wait(1);
    }
    else
    {
    }
    c_sel(kr);
    c_autodepth(0);
    c_depth(80000);
    c_setxy(430, 327);
    c_autowalk(0);
    c_sprite(spr_dkris_dl_soul_walk);
    c_visible(0);
    c_halt();
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 14);
    c_wait(30);
    c_sprite(spr_dkris_dl_soul_walk);
    c_visible(1);
    c_var_instance(kris_overlay, "overlay_active", true);
    c_soundplay(snd_dooropen);
    c_var_instance(door_marker, "image_index", 1);
    c_wait(5);
    c_soundplay(snd_doorclose);
    c_var_instance(door_marker, "image_index", 0);
    c_wait(60);
    c_imagespeed(0.2);
    c_waitcustom();
}
if (con == 10 && customcon == 1)
{
    con = 20;
    customcon = 0;
    c_waitcustom_end();
    c_walkdirect_wait(430, 345, 15);
    c_sprite(spr_dkris_dl_soul_walk);
    c_walkdirect_wait(420, 345, 15);
    c_halt();
    c_speaker("noelle");
    c_fefc(0, 0);
    c_msgsetloc(0, "* Kris?..^1. Are you up there?/%", "obj_ch4_PDC10B_slash_Step_0_gml_91_0");
    c_talk_wait();
    c_sel(kr);
    c_autowalk(0);
    c_halt();
    c_sprite(spr_dkris_ur_soul_run);
    c_wait(1);
    c_imagespeed(0.4);
    c_walkdirect_wait(462, 334, 8);
    c_halt();
    c_wait(1);
    c_autowalk(0);
    c_sprite(spr_kris_soul_stash);
    c_var_lerp_to_instance(kr_actor, "image_index", 4, 8);
    c_wait(4);
    c_snd_play(snd_hurt1);
    c_snd_play(snd_noise);
    c_shakeobj();
    c_var_instance(id, "drawer_shake", true);
    c_var_instance(kris_overlay, "overlay_active", false);
    c_wait(15);
    c_autowalk(0);
    c_sprite(spr_krisu);
    c_imagespeed(0.2);
    c_walkdirect_wait(472, 343, 8);
    c_halt();
    c_autowalk(1);
    c_facing("l");
    c_pan(240, cameray(), 60);
    c_sel(no);
    c_walkdirect_wait(290, 336, 60);
    c_walkdirect(328, 336, 30);
    c_wait(60);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E9* Umm^1, Kris..^1. I.../", "obj_ch4_PDC10B_slash_Step_0_gml_140_0");
    c_msgnextloc("\\E3* There's..^1. something I'd..^1. like to talk to you about./", "obj_ch4_PDC10B_slash_Step_0_gml_141_0");
    c_msgnextloc("\\E4* You know^1, just the two of us./", "obj_ch4_PDC10B_slash_Step_0_gml_142_0");
    c_msgnextloc("\\E9* ..^1. if..^1. if you don't mind^1, I mean./", "obj_ch4_PDC10B_slash_Step_0_gml_143_0");
    c_msgnextloc("\\E4* I'll..^1. be in my room^1, okay?/%", "obj_ch4_PDC10B_slash_Step_0_gml_144_0");
    c_talk();
    c_wait_box(1);
    c_sel(no);
    c_sprite(spr_noelle_walk_right_unhappy);
    c_wait_box(2);
    c_sel(no);
    c_sprite(spr_noelle_walk_right_lw_neutral);
    c_wait_box(3);
    c_sel(no);
    c_sprite(spr_noelle_walk_right_unhappy);
    c_wait_box(4);
    c_sel(no);
    c_sprite(spr_noelle_walk_right_lw_neutral);
    c_wait_talk();
    c_sel(no);
    c_walk_wait("u", 1, 12);
    c_soundplay(snd_dooropen);
    c_var_instance(noelle_door_marker, "visible", 1);
    c_var_instance(noelle_door_marker, "image_index", 1);
    c_wait(8);
    c_imagespeed(0.2);
    c_walk("u", 1, 10);
    c_wait(6);
    c_var_instance(id, "noelle_hide", true);
    c_wait(26);
    c_sel(no);
    c_visible(0);
    c_soundplay(snd_doorclose);
    c_var_instance(noelle_door_marker, "image_index", 0);
    c_wait(60);
    c_sel(kr);
    c_walkdirect_wait(472, 334, 8);
    c_facing("u");
    c_wait(15);
    c_snd_play(snd_grab);
    c_sprite(spr_dkris_ur_soul_walk);
    c_addxy(0, 4);
    c_shakeobj();
    c_var_instance(id, "drawer_shake", true);
    c_var_instance(kris_overlay, "overlay_active", true);
    c_wait(15);
    c_sprite(spr_dkris_dl_soul_walk);
    c_wait(30);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect_wait(472, 345, 15);
    c_sprite(spr_dkris_dl_soul_walk);
    c_waitcustom();
}
if (con == 20 && customcon == 1)
{
    con = 50;
    customcon = 0;
    c_waitcustom_end();
    c_walkdirect_wait(430, 345, 15);
    c_pannable(1);
    c_panspeed(-2, 0, 60);
    c_sprite(spr_dkris_dl_soul_walk);
    c_walkdirect_wait(290, 345, 60);
    c_panspeed(0, 2, 50);
    c_sprite(spr_dkris_dl_soul_walk);
    c_walkdirect_wait(290, 477, 90);
    c_sprite(spr_dkris_ur_soul_walk);
    c_walkdirect_wait(364, 477, 50);
    c_sprite(spr_dkris_ur_soul_walk);
    c_halt();
    c_sel(kr);
    c_imagespeed(0.25);
    c_walk_wait("u", 1, 8);
    c_halt();
    c_wait(5);
    c_soundplay(snd_dooropen);
    c_var_instance(closet_marker, "image_index", 1);
    c_wait(15);
    c_imagespeed(0.25);
    c_walk("u", 1, 10);
    c_wait(4);
    c_var_lerp_to_instance(kris_overlay, "heart_radius", 0, 15);
    c_var_instance(id, "kris_hide", true);
    c_wait(15);
    c_var_instance(kris_overlay, "target", -4);
    c_sel(kr);
    c_visible(0);
    c_soundplay(snd_doorclose);
    c_var_instance(closet_marker, "image_index", 0);
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 14);
    c_wait(14);
    c_var_instance(kris_overlay, "overlay_active", false);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 50 && !i_ex(obj_cutscene_master))
{
    instance_create(0, 0, obj_persistentfadein);
    global.plot = 62;
    room_goto(room_lw_noellehouse_closet);
    con = 99;
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
if (noelle_hide)
{
    noelle_shadow = clamp(noelle_shadow + 0.2, 0, 1);
    var shadow = noelle_shadow;
    with (no_actor)
        color_blend = merge_color(c_white, make_color_hsv(0, 0, 0), shadow);
    if (noelle_shadow >= 1)
        noelle_hide = false;
}
if (drawer_shake)
{
    drawer_shake = false;
    with (drawer_marker)
        scr_shakeobj();
}
