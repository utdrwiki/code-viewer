if (con == 0)
{
    con = (susie_con == 1) ? 9 : 19;
    alarm[0] = 1;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
}
if (con == 10 && !d_ex())
{
    con = 5;
    alarm[0] = 1;
    global.facing = 0;
    var church_clothes = global.plot < 40;
    scr_flag_set(747, 1);
    c_sel(su);
    if (church_clothes)
    {
        c_autowalk(0);
        c_sprite(spr_susie_walk_left_church);
    }
    else
    {
        c_facing("l");
    }
    if (su_actor.y >= 115)
        c_msgside("top");
    c_speaker("susie");
    c_msgsetloc(0, "\\EC* Hey^1, the hell does your brother have all the prizes?/", "obj_ch4_PDC01D_slash_Step_0_gml_48_0");
    c_msgnextloc("\\EL* Wait a sec.../%", "obj_ch4_PDC01D_slash_Step_0_gml_49_0");
    c_talk_wait();
    c_sel(kr);
    if (church_clothes)
        c_sprite(spr_kris_walk_left_church);
    else
        c_facing("l");
    c_sel(su);
    if (church_clothes)
        c_imagespeed(0.2);
    var su_walktime = scr_calculate_move_distance(su_actor.x, su_actor.y, 113, su_actor.y, 3);
    c_walkdirect_wait(113, su_actor.y, su_walktime);
    if (church_clothes)
        c_sprite(spr_susie_walk_up_church);
    if ((su_actor.y - 100) >= 20)
        c_walkdirect_wait(113, 100, 15);
    c_walkdirect_wait(113, 80, 10);
    c_halt();
    c_autowalk(0);
    var kick_sprite = church_clothes ? 5471 : 479;
    c_sprite(kick_sprite);
    c_imagespeed(0.3);
    c_wait(6);
    c_soundplay(snd_impact);
    c_shake();
    c_wait(5);
    c_imageindex(4);
    c_imagespeed(0);
    c_wait(5);
    c_autowalk(1);
    if (church_clothes)
        c_sprite(spr_susie_walk_up_church);
    else
        c_facing("u");
    c_var_instance(id, "star_fall", true);
    c_sound_play(snd_wing);
    c_wait(10);
    c_sel(su);
    if (church_clothes)
        c_sprite(spr_susie_catch_church);
    else
        c_sprite(spr_susie_catch_lw);
    c_sound_play(snd_noise);
    c_wait(15);
    if (church_clothes)
        c_sprite(spr_susie_throw_star_church);
    else
        c_sprite(spr_susie_throw_star);
    c_halt();
    c_wait(30);
    c_sel(su);
    c_autowalk(0);
    c_imagespeed(0);
    c_imageindex(1);
    c_wait(20);
    c_sel(kr);
    c_facing("u");
    c_sound_play_x(snd_wing, 1, 1.2);
    c_var_instance(id, "star_throw", true);
    c_sel(su);
    c_imageindex(2);
    c_wait(1);
    c_imageindex(3);
    c_wait(10);
    c_autowalk(1);
    if (church_clothes)
        c_sprite(spr_susie_walk_right_church);
    else
        c_facing("r");
    c_wait(30);
    if (church_clothes)
        c_sprite(spr_susie_walk_down_church);
    else
        c_facing("d");
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\EL* There you go. The Susie prize. For having me over your house./%", "obj_ch4_PDC01D_slash_Step_0_gml_167_0");
    c_talk_wait();
    if (church_clothes)
    {
        c_autowalk(0);
        c_imagespeed(0.2);
        c_sprite(spr_susie_walk_down_church);
    }
    c_sel(kr);
    if (church_clothes)
        c_sprite(spr_kris_walk_left_church);
    else
        c_facing("l");
    var su_walktime_back = scr_calculate_move_distance(113, 80, kr_actor.x - 30, kr_actor.y - 6, 3);
    c_sel(su);
    if (church_clothes)
    {
        c_sprite(spr_susie_walk_right_church);
        c_imagespeed(0.2);
    }
    c_walkdirect_wait(kr_actor.x - 30, kr_actor.y - 6, su_walktime_back);
    if (church_clothes)
    {
        c_halt();
    }
    else
    {
        c_sel(su);
        c_facing("r");
    }
    c_wait(5);
    c_sel(kr);
    if (church_clothes)
        c_sprite(spr_kris_walk_down_church);
    else
        c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 20 && !d_ex())
{
    con = 5;
    alarm[0] = 1;
    global.facing = 0;
    scr_flag_set(748, 1);
    with (obj_event_manager)
        trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_29);
    c_speaker("susie");
    c_msgsetloc(0, "\\Ee* ..^1. what the hell is this giant bloodstain?/", "obj_ch4_PDC01D_slash_Step_0_gml_228_0");
    c_msgnextloc("\\EP* Just use VINEGAR^1, dumbass. Vinegar and hot water. Cleans it up./", "obj_ch4_PDC01D_slash_Step_0_gml_229_0");
    c_msgnextloc("\\EK* ..^1. look^1, we don't have time to.../%", "obj_ch4_PDC01D_slash_Step_0_gml_230_0");
    c_talk_wait();
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 15);
    c_wait(45);
    c_var_instance(stain_cover, "visible", 1);
    c_speaker("no_name");
    c_msgsetloc(0, "* (Somehow^1, you and Susie made time to clean up the stain.)/%", "obj_ch4_PDC01D_slash_Step_0_gml_239_0");
    c_talk_wait();
    c_wait(15);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 15);
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* Dammit. We're gonna be late. Dammit./%", "obj_ch4_PDC01D_slash_Step_0_gml_248_0");
    c_talk_wait();
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 6 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    con = 99;
}
if (star_fall)
{
    star_fall_timer++;
    if (star_fall_timer == 1)
    {
        with (asriel_star)
            gravity = 1;
    }
    if (star_fall_timer == 10)
    {
        with (asriel_star)
        {
            gravity = 0;
            vspeed = 0;
            visible = 0;
        }
    }
}
if (star_throw)
{
    star_throw_timer++;
    if (star_throw_timer == 1)
    {
        with (kris_star)
        {
            depth = 98000;
            visible = 1;
            x = 145;
            y = 94;
            vspeed = -11;
            gravity = 1;
            hspeed = 11;
        }
    }
    if (star_throw_timer == 10)
    {
        with (kris_star)
        {
            gravity = 0;
            vspeed = 0;
            hspeed = 0;
            x = xstart;
            y = ystart;
        }
    }
    if (star_throw_timer >= 30)
    {
    }
}

enum UnknownEnum
{
    Value_0,
    Value_29 = 29
}
