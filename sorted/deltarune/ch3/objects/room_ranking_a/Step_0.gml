if (con < 0)
    exit;
if (con == 10 && global.interact == 0 && !d_ex())
{
    con = 11;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    c_sel(kr);
    c_walkdirect(219, 218, 15);
    c_sel(su);
    c_walkdirect(264, 218, 15);
    c_sel(ra);
    c_walkdirect_wait(170, 222, 15);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_sel(kr);
    c_facing("u");
    c_wait(15);
    c_speaker("no_name");
    c_msgsetloc(0, "* Haha^1, thanks for the points..^1. sucker!/%", "obj_room_ranking_a_slash_Step_0_gml_38_0");
    c_talk_wait();
    c_snd_play(snd_wing);
    c_var_lerp_to_instance(pippins_marker, "x", pippins_marker.x + 280, 30, 2, "out");
    c_wait(90);
    c_snd_play(snd_wing);
    c_var_lerp_to_instance(pippins_marker, "x", pippins_marker.x, 30, 2, "in");
    c_wait(45);
    c_speaker("no_name");
    c_msgsetloc(0, "* ..^1. is what I would say if you had enough POINTs!/", "obj_room_ranking_a_slash_Step_0_gml_57_0");
    c_msgnextloc("* Gee^1, try being responsible and saving 'em up^1, would ya!?/%", "obj_room_ranking_a_slash_Step_0_gml_58_0");
    c_talk_wait();
    c_pannable(1);
    c_panobj(kr_actor, 15);
    c_wait(15);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 11 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
    with (pippins_marker)
        image_speed = 0.2;
}
if (con == 50 && global.interact == 0 && !d_ex())
{
    con = 51;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    c_sel(kr);
    c_walkdirect(219, 218, 15);
    c_sel(su);
    c_walkdirect(264, 218, 15);
    c_sel(ra);
    c_walkdirect_wait(170, 222, 15);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_sel(kr);
    c_facing("u");
    c_wait(15);
    c_speaker("no_name");
    c_msgsetloc(0, "* Alright^1, alright^1! Now that we've got those.../%", "obj_room_ranking_a_slash_Step_0_gml_116_0");
    c_talk_wait();
    c_var_instance(pippins_marker, "sprite_index", spr_npc_pippins_up);
    c_var_lerp_to_instance(pippins_marker, "y", pippins_marker.y - 10, 8);
    c_wait(30);
    c_speaker("no_name");
    c_msgsetloc(0, "* Lock opening noise..^1. Lock opening noise.../%", "obj_room_ranking_a_slash_Step_0_gml_126_0");
    c_talk_wait();
    c_waitcustom();
}
if (con == 51 && customcon == 1 && !d_ex())
{
    con = 52;
    alarm[0] = 30;
    with (obj_dw_ranking_minigame_door)
    {
        if (game_type == "susiezilla")
            unlock_door();
    }
}
if (con == 53 && customcon == 1 && !d_ex())
{
    con = 54;
    customcon = 0;
    c_waitcustom_end();
    c_var_instance(pippins_marker, "sprite_index", spr_npc_pippins_jump_cool);
    c_var_lerp_to_instance(pippins_marker, "x", pippins_marker.x + 40, 8);
    c_wait(9);
    c_speaker("no_name");
    c_msgsetloc(0, "* Look at that^1, would ya^1! The lock's all gone!/", "obj_room_ranking_a_slash_Step_0_gml_159_0");
    c_msgnextloc("* Not a trace^1! You'd hardly believe it was ever there at all!/", "obj_room_ranking_a_slash_Step_0_gml_160_0");
    c_msgnextloc("* Well^1, see ya^1! ..^1. no refunds!/%", "obj_room_ranking_a_slash_Step_0_gml_161_0");
    c_talk_wait();
    c_var_lerp_to_instance(pippins_marker, "x", camerax() + view_wport[0] + 100, 30, 2, "out");
    c_wait(45);
    c_pannable(1);
    c_panobj(kr_actor, 15);
    c_wait(15);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 54 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
    scr_flag_set(1189, 1);
    with (pippins_marker)
        instance_destroy();
    with (pippins_readable)
        instance_destroy();
    with (pippins_block)
        instance_destroy();
}
