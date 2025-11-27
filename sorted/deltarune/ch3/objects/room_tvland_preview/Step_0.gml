if (con < 0)
    exit;
if (con == 10 && !d_ex() && global.interact == 0)
{
    con = 20;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    c_var_instance(pippins_cheater_marker, "image_speed", 0);
    c_var_instance(pippins_cheater_marker, "image_index", 0);
    c_sel(kr);
    c_walkdirect(1124, 538, 15);
    c_sel(su);
    c_walkdirect(1147, 545, 15);
    c_sel(ra);
    c_walkdirect_wait(1091, 549, 15);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_sel(kr);
    c_facing("u");
    c_msgside("top");
    c_speaker("no_name");
    c_msgsetloc(0, "* Lessee..^1. 1^1, 2^1, 3^1, 4^1, 5^1, 6..^1. 1500^1! Perfect^1, gimme that!/%", "obj_room_tvland_preview_slash_Step_0_gml_38_0");
    c_talk_wait();
    c_var_lerp_to_instance(pippins_cheater_marker, "y", pippins_cheater_marker.y + 10, 5);
    c_wait(5);
    c_sel(kr);
    c_shakeobj();
    c_sound_play(snd_grab);
    c_sound_play(snd_item);
    c_var_lerp_to_instance(pippins_cheater_marker, "y", pippins_cheater_marker.y, 5);
    c_wait(30);
    c_speaker("no_name");
    c_msgsetloc(0, "* Alright^1, you want an S^1, an \"S^1,\" okay^1, okay^1, gimme a sec.../%", "obj_room_tvland_preview_slash_Step_0_gml_54_0");
    c_talk_wait();
    c_var_lerp_to_instance(pippins_cheater_marker, "y", pippins_cheater_marker.y - 10, 5);
    c_var_instance(pippins_cheater_marker, "sprite_index", spr_npc_pippins_up);
    c_wait(15);
    c_sound_play(snd_window_draw_squeak);
    c_wait(60);
    c_var_instance(pippins_cheater_marker, "sprite_index", spr_npc_pippins_jump_cool);
    c_var_lerp_to_instance(pippins_cheater_marker, "y", pippins_cheater_marker.y, 10);
    c_wait(30);
    c_speaker("no_name");
    c_msgsetloc(0, "* This^1! Is an S..^1. This IS an S^1, right? Actually^1, heh^1, it looks better than normal./", "obj_room_tvland_preview_slash_Step_0_gml_75_0");
    c_msgnextloc("* Anyway^1, they'll let you in with this. Pretty sure. Good \"luck\"^1! Heheheh!/%", "obj_room_tvland_preview_slash_Step_0_gml_76_0");
    c_talk_wait();
    c_var_lerp_to_instance(pippins_cheater_marker, "y", pippins_cheater_marker.y - 10, 5);
    c_wait(6);
    c_snd_play(snd_jump);
    c_var_instance(id, "pippins_flee", true);
    c_wait(5);
    c_sel(kr);
    c_facing("d");
    c_sel(ra);
    c_facing("d");
    c_sel(su);
    c_facing("d");
    c_wait(30);
    c_var_lerp_to_instance(pippins_cheater_marker, "y", 1020, 30);
    c_wait(30);
    c_pannable(1);
    c_panobj(kr_actor, 15);
    c_wait(15);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (pippins_flee)
{
    pippins_flee = false;
    with (pippins_cheater_marker)
    {
        image_index = 4;
        scr_jump_to_point(1101, 674, 60, 15);
        scr_var_delay("depth", 79990, 1);
        scr_var_delay("image_index", 0, 10);
    }
    with (pippins_cheater_readable)
        instance_destroy();
}
if (con == 20 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
    if (global.plot >= 120 && global.plot < 160)
        scr_flag_set(1076, 1);
    if (global.plot >= 160)
        scr_flag_set(1077, 1);
    with (obj_mainchara)
        usprite = spr_krisu_dark_cool;
}
