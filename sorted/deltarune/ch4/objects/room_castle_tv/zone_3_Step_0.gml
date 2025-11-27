if (maus_shake)
{
    with (maus_marker)
        x = xstart + choose(-1, 0, 1);
}
if (con < 0)
    exit;
if (con == 1 && !d_ex() && global.interact == 0)
{
    con = 100;
    global.interact = 1;
    scr_speaker("no_name");
    msgsetloc(0, "* (It's a very tall statue..^1. It has cat ears.)/%", "obj_room_castle_tv_zone_3_slash_Step_0_gml_21_0");
    d_make();
}
if (con == 5 && !d_ex() && global.interact == 0)
{
    con = 100;
    global.interact = 1;
    scr_speaker("no_name");
    msgsetloc(0, "* (It seems the Maus is terrified of the statue...)/%", "obj_room_castle_tv_zone_3_slash_Step_0_gml_34_0");
    d_make();
}
if (con == 10 && !d_ex() && global.interact == 0)
{
    con = 11;
    global.interact = 1;
    global.msc = -99;
    global.choice = -1;
    global.choicemsg[0] = stringsetloc("#Pet it", "obj_room_castle_tv_zone_3_slash_Step_0_gml_48_0");
    global.choicemsg[1] = stringsetloc("#Don't", "obj_room_castle_tv_zone_3_slash_Step_0_gml_49_0");
    global.choicemsg[2] = stringset("");
    global.choicemsg[3] = stringset("");
    scr_speaker("no_name");
    msgsetloc(0, "* (It's a statue..^1. It has cat ears.)/", "obj_room_castle_tv_zone_3_slash_Step_0_gml_54_0");
    msgnext("\\C2 ");
    d_make();
}
if (con == 11 && global.choice != -1)
{
    con = 100;
    k_d(1);
    if (global.choice == 0)
        con = solo_mode ? 15 : 20;
    if (global.choice == 1)
        con = 100;
}
if (con == 15)
{
    con = 49;
    alarm[0] = 30;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    var run_speed = 6;
    var kr_x_pos = 890;
    var kr_y_pos = 208;
    var kr_walktime = scr_calculate_move_distance(kr_actor.x, kr_actor.y, kr_x_pos, kr_y_pos, run_speed);
    c_sel(kr);
    c_walkdirect(kr_x_pos, kr_y_pos, kr_walktime);
    c_delayfacing(kr_walktime + 1, "u");
    c_wait(15);
    c_customfunc(function()
    {
        with (statue_cat)
        {
            act = 1;
            meow = snd_play(snd_meow);
            sound_pitch(meow, random_range(0.5, 1.5));
            image_index = 1;
        }
    });
    c_var_instance(id, "maus_shake", false);
    c_var_instance(maus_marker, "x", maus_marker.xstart);
    c_wait(30);
    c_sel(kr);
    c_facing("d");
    c_snd_play(snd_mouse);
    c_customfunc(function()
    {
        with (maus_marker)
        {
            sprite_index = spr_npc_maus_idle_overworld;
            x += 18;
            y += 36;
        }
    });
    c_wait(30);
    c_var_instance(maus_marker, "image_speed", 0.2);
    c_var_lerp_to_instance(maus_marker, "x", 902, 15);
    c_var_lerp_to_instance(maus_marker, "y", 299, 15);
    run_speed = 2;
    var kr_y_pos_top = 190;
    kr_walktime = scr_calculate_move_distance(kr_x_pos, kr_y_pos, kr_x_pos, kr_y_pos_top, run_speed);
    c_sel(kr);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect(kr_x_pos, kr_y_pos_top, kr_walktime);
    c_delaycmd4(kr_walktime + 1, "imagespeed", 0);
    c_delaycmd4(kr_walktime + 1, "imageindex", 0);
    c_wait(30);
    c_speaker("no_name");
    c_msgsetloc(0, "* (You saved the Maus from the cat statue..^1. It considers you its hero.)/", "obj_room_castle_tv_zone_3_slash_Step_0_gml_149_0");
    c_msgnextloc("* (The Maus transforms from admiration...!!!)/%", "obj_room_castle_tv_zone_3_slash_Step_0_gml_150_0");
    c_talk_wait();
    c_var_instance(id, "maus_transform", true);
    c_wait_if(id, "maus_transform", "=", false);
    c_customfunc(function()
    {
        mike_controller = instance_create(0, 0, obj_mike_controller);
        with (obj_mike_hand)
            visible = 0;
    });
    c_wait(15);
    c_customfunc(function()
    {
        var hand_x = 0;
        var hand_y = 0;
        var angle = 0;
        with (obj_mike_controller)
        {
            angle = point_direction(mx, my, x, y) + 90 + hand_angle;
            hand_x = mx + msx;
            hand_y = my + msy;
        }
        with (hand_marker)
        {
            scr_move_to_point_over_time(hand_x, hand_y, 15);
            scr_lerpvar("image_angle", 0, angle, 15);
        }
    });
    c_wait(20);
    c_customfunc(function()
    {
        with (obj_mike_hand)
            visible = 1;
        with (hand_marker)
            visible = 0;
    });
    c_wait(30);
    if (global.is_console || onSteamDeck())
    {
        c_speaker("no_name");
        c_msgsetsubloc(0, "* (It looks like you can use the MAUS with ~1 and ~2!)/%", scr_get_input_name_console(32779), scr_get_input_name(4), "obj_room_castle_tv_zone_3_slash_Step_0_gml_197_0");
        c_talk_wait();
    }
    else
    {
        c_speaker("no_name");
        c_msgsetloc(0, "* (It looks like you can use the MAUS with the MOUSE...!)/%", "obj_room_castle_tv_zone_3_slash_Step_0_gml_202_0");
        c_talk_wait();
    }
    c_pannable(1);
    c_panobj(kr_actor, 20);
    c_wait(21);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 20)
{
    con = 49;
    alarm[0] = 30;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    var run_speed = 6;
    var kr_x_pos = 890;
    var kr_y_pos = 208;
    var kr_walktime = scr_calculate_move_distance(kr_actor.x, kr_actor.y, kr_x_pos, kr_y_pos, run_speed);
    c_sel(kr);
    c_walkdirect(kr_x_pos, kr_y_pos, kr_walktime);
    c_delayfacing(kr_walktime + 1, "u");
    var su_x_pos = 931;
    var su_y_pos = 192;
    var su_walktime = scr_calculate_move_distance(su_actor.x, su_actor.y, su_x_pos, su_y_pos, run_speed);
    c_sel(su);
    c_walkdirect(su_x_pos, su_y_pos, su_walktime);
    c_delayfacing(su_walktime + 1, "u");
    var ra_x_pos = 837;
    var ra_y_pos = 196;
    var ra_walktime = scr_calculate_move_distance(ra_actor.x, ra_actor.y, ra_x_pos, ra_y_pos, run_speed);
    c_sel(ra);
    c_walkdirect(ra_x_pos, ra_y_pos, ra_walktime);
    c_delayfacing(ra_walktime + 1, "u");
    c_wait(30);
    c_customfunc(function()
    {
        with (statue_cat)
        {
            act = 1;
            meow = snd_play(snd_meow);
            sound_pitch(meow, random_range(0.5, 1.5));
            image_index = 1;
        }
    });
    c_var_instance(id, "maus_shake", false);
    c_var_instance(maus_marker, "x", maus_marker.xstart);
    c_wait(30);
    c_sel(kr);
    c_facing("d");
    c_sel(su);
    c_facing("d");
    c_sel(ra);
    c_facing("d");
    c_snd_play(snd_mouse);
    c_customfunc(function()
    {
        with (maus_marker)
        {
            sprite_index = spr_npc_maus_idle_overworld;
            x += 18;
            y += 36;
        }
    });
    c_wait(30);
    c_var_instance(maus_marker, "image_speed", 0.2);
    c_var_lerp_to_instance(maus_marker, "x", 902, 15);
    c_var_lerp_to_instance(maus_marker, "y", 299, 15);
    run_speed = 2;
    var kr_y_pos_top = 190;
    kr_walktime = scr_calculate_move_distance(kr_x_pos, kr_y_pos, kr_x_pos, kr_y_pos_top, run_speed);
    c_sel(kr);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect(kr_x_pos, kr_y_pos_top, kr_walktime);
    c_delaycmd4(kr_walktime + 1, "imagespeed", 0);
    c_delaycmd4(kr_walktime + 1, "imageindex", 0);
    var su_y_pos_top = 174;
    su_walktime = scr_calculate_move_distance(su_x_pos, su_y_pos, su_x_pos, su_y_pos_top, run_speed);
    c_sel(su);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect(su_x_pos, su_y_pos_top, su_walktime);
    c_delaycmd4(su_walktime + 1, "imagespeed", 0);
    c_delaycmd4(su_walktime + 1, "imageindex", 0);
    var ra_y_pos_top = 178;
    ra_walktime = scr_calculate_move_distance(ra_x_pos, ra_y_pos, ra_x_pos, ra_y_pos_top, run_speed);
    c_sel(ra);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect(ra_x_pos, ra_y_pos_top, ra_walktime);
    c_delaycmd4(ra_walktime + 1, "imagespeed", 0);
    c_delaycmd4(ra_walktime + 1, "imageindex", 0);
    c_wait(30);
    c_speaker("no_name");
    c_msgsetloc(0, "* (You saved the Maus from the cat statue..^1. It considers you its hero.)/", "obj_room_castle_tv_zone_3_slash_Step_0_gml_324_0");
    c_msgnextloc("* (The Maus transforms from admiration...!!!)/%", "obj_room_castle_tv_zone_3_slash_Step_0_gml_325_0");
    c_talk_wait();
    c_var_instance(id, "maus_transform", true);
    c_wait_if(id, "maus_transform", "=", false);
    c_customfunc(function()
    {
        mike_controller = instance_create(0, 0, obj_mike_controller);
        with (obj_mike_hand)
            visible = 0;
    });
    c_wait(15);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_down_subtle);
    c_sel(su);
    c_sprite(spr_susie_sheeh);
    c_customfunc(function()
    {
        var hand_x = 0;
        var hand_y = 0;
        var angle = 0;
        with (obj_mike_controller)
        {
            angle = point_direction(mx, my, x, y) + 90 + hand_angle;
            hand_x = mx + msx;
            hand_y = my + msy;
        }
        with (hand_marker)
        {
            scr_move_to_point_over_time(hand_x, hand_y, 15);
            scr_lerpvar("image_angle", 0, angle, 15);
        }
    });
    c_wait(20);
    c_sel(ra);
    c_facing("d");
    c_sel(su);
    c_facing("d");
    c_customfunc(function()
    {
        with (obj_mike_hand)
            visible = 1;
        with (hand_marker)
            visible = 0;
    });
    c_wait(30);
    c_sel(ra);
    c_facing("r");
    if (global.is_console || onSteamDeck())
    {
        c_speaker("ralsei");
        c_msgsetsubloc(0, "\\EJ* (Kris^1, it looks like you can use the MAUS with ~1 and ~2!)/%", scr_get_input_name_console(32779), scr_get_input_name(4), "obj_room_castle_tv_zone_3_slash_Step_0_gml_387_0");
        c_talk_wait();
    }
    else
    {
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EJ* (Kris^1, it looks like you can use the MAUS with the MOUSE...!)/%", "obj_room_castle_tv_zone_3_slash_Step_0_gml_392_0");
        c_talk_wait();
    }
    c_sel(ra);
    c_facing("d");
    c_pannable(1);
    c_panobj(kr_actor, 20);
    c_wait(21);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 50 && !i_ex(obj_cutscene_master))
{
    con = 100;
    global.flag[1692] = 1;
    remove_cat();
    remove_maus();
}
if (con == 100 && !d_ex())
{
    con = -1;
    global.interact = 0;
}
if (maus_transform)
{
    maus_transform_timer++;
    if (maus_transform_timer == 1)
    {
        maus_flash = instance_create(maus_marker.x, maus_marker.y, obj_whiteout);
        var _target = maus_marker;
        with (maus_flash)
            start_whiteout(4, _target, true);
        hand_marker = scr_marker(maus_marker.x, maus_marker.y, spr_mike_hand);
        with (hand_marker)
        {
            image_xscale = 0;
            image_yscale = 0;
        }
        hand_flash = instance_create(hand_marker.x, hand_marker.y, obj_whiteout);
        _target = hand_marker;
        with (hand_flash)
            start_whiteout(4, _target, true);
    }
    if (maus_transform_timer == 6)
    {
        snd_play(snd_hypnosis);
        scr_lerp_var_instance(hand_marker, "image_xscale", 0, 0.5, 4);
        scr_lerp_var_instance(hand_marker, "image_yscale", 0, 0.5, 4);
        scr_lerp_var_instance(maus_marker, "image_xscale", 2, 0, 4);
        scr_lerp_var_instance(maus_marker, "image_yscale", 2, 0, 4);
    }
    if (maus_transform_timer == 11)
    {
        with (hand_flash)
            stop_whiteout(4);
        with (maus_flash)
            stop_whiteout(4);
    }
    if (maus_transform_timer == 15)
    {
        maus_transform = false;
        maus_transform_timer = 0;
    }
}
