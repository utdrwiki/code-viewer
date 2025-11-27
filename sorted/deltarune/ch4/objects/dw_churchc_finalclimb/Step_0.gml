wobblex = 0;
if (wobble > 0)
{
    wobblex = sin(get_timer() / 250000) * 2 * wobble;
    layer_x(glasslayers[11], wobblex);
    layer_x(glasslayers[10], wobblex);
    layer_x(glasslayers[9], wobblex);
    jackenstein.x = 204 + wobblex;
}
var _rowstoshake = array_length(glassshakerows);
if (_rowstoshake > 0)
{
    for (var i = 0; i < array_length(glassshakerows); i++)
    {
        if (glassshakerows[i][1] > 0.1)
        {
            var _shake = sin(get_timer() / 25000) * glassshakerows[i][1];
            if (glassshakerows[i][0] == 11 && wobblex > 0)
            {
                _shake += wobblex;
                jackenstein.x = 204 + wobblex + _shake;
            }
            layer_x(glasslayers[glassshakerows[i][0]], _shake);
            glassshakerows[i][1] = max(0, lerp(glassshakerows[i][1], 0, 0.1));
        }
        else
        {
            array_delete(glassshakerows, i, 1);
        }
    }
}
if (!init)
{
    init = 1;
    scr_populatechars();
}
if (con < 0)
    exit;
if (con == 0 && global.interact == 0 && obj_mainchara.x >= 160 && obj_mainchara.y < 2350)
{
    scr_flag_set(7, 1);
    global.interact = 1;
    con = 2;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    var kr_x_pos = 301;
    var kr_y_pos = 2270;
    var kr_walktime = round(point_distance(kr_actor.x, kr_actor.y, kr_x_pos, kr_y_pos) / 6);
    c_sel(kr);
    c_walkdirect(kr_x_pos, kr_y_pos, kr_walktime);
    c_delayfacing(kr_walktime + 1, "u");
    var su_x_pos = 243;
    var su_y_pos = 2278;
    var su_walktime = round(point_distance(su_actor.x, su_actor.y, su_x_pos, su_y_pos) / 6);
    c_sel(su);
    c_walkdirect(su_x_pos, su_y_pos, su_walktime);
    c_delayfacing(su_walktime + 1, "u");
    var ra_x_pos = 347;
    var ra_y_pos = 2283;
    var ra_walktime = round(point_distance(ra_actor.x, ra_actor.y, ra_x_pos, ra_y_pos) / 6);
    c_sel(ra);
    c_walkdirect(ra_x_pos, ra_y_pos, ra_walktime);
    c_delayfacing(ra_walktime + 1, "u");
    c_pannable(1);
    c_pan(camerax(), 2000, 20);
    c_wait(30);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E5* The fountain.../", "obj_dw_churchc_finalclimb_slash_Step_0_gml_106_0");
    c_msgnextloc("\\EE* I can feel its presence just past this wall.../%", "obj_dw_churchc_finalclimb_slash_Step_0_gml_107_0");
    c_talk_wait();
    c_var_instance(sword_controller, "target_y_pos", 2120);
    c_var_instance(sword_controller_b, "target_y_pos", 2180);
    c_var_instance(sword_controller_c, "target_y_pos", 2240);
    c_var_instance(sword_controller, "is_active", true);
    c_wait(10);
    c_var_instance(sword_controller_b, "is_active", true);
    c_wait(10);
    c_var_instance(sword_controller_c, "is_active", true);
    c_wait_if(sword_controller, "destroyed", "=", true);
    c_customfunc(glass_row_crack, 3);
    c_customfunc(glass_row_shake, [3, 6]);
    c_wait_if(sword_controller_b, "destroyed", "=", true);
    c_customfunc(glass_row_shake, [3, 6]);
    c_wait_if(sword_controller_c, "destroyed", "=", true);
    c_customfunc(glass_row_shatter, 3);
    c_customfunc(glass_row_shake, [2, 3]);
    c_customfunc(glass_row_shake, [4, 3]);
    c_sel(su);
    c_sprite(spr_susie_shocked_behind);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_behind);
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\Ed* H..^1. hey^1! W-wait!!!/", "obj_dw_churchc_finalclimb_slash_Step_0_gml_143_0");
    c_msgnextloc("\\Eb* The hell are we going to climb up there now...?/%", "obj_dw_churchc_finalclimb_slash_Step_0_gml_144_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_facing("u");
    c_sel(ra);
    c_facing("u");
    c_wait_talk();
    c_wait(30);
    c_sel(su);
    c_emote("!", 30);
    c_sel(ra);
    c_emote("!", 30);
    c_speaker("jackenstein");
    c_msgsetloc(0, "* FRAINDS NEED HELP...?/%", "obj_dw_churchc_finalclimb_slash_Step_0_gml_165_0");
    c_talk();
    c_wait(30);
    c_wait_talk();
    c_sel(su);
    c_facing("d");
    c_sel(ra);
    c_facing("d");
    c_sel(kr);
    c_facing("d");
    c_var_instance(jackenstein, "y", 2600);
    c_var_instance(jackenstein, "visible", 1);
    c_var_instance(jackenstein, "image_speed", 0.2);
    c_var_lerp_to_instance(jackenstein, "y", 2360, 30);
    c_wait(30);
    c_var_instance(jackenstein, "image_index", 0);
    c_var_instance(jackenstein, "image_speed", 0);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_down_subtle);
    c_msgside("top");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EC* Mr. Jack^1, what are you doing here? It's dangerous.../", "obj_dw_churchc_finalclimb_slash_Step_0_gml_200_0");
    c_facenext("susie", "Z");
    c_msgnextloc("\\EZ* Yeah^1, get back to the study^1, dude./%", "obj_dw_churchc_finalclimb_slash_Step_0_gml_202_0");
    c_talk_wait();
    c_var_instance(jackenstein, "image_speed", 0.2);
    c_var_lerp_to_instance(jackenstein, "y", 2320, 10);
    c_wait(11);
    c_var_instance(jackenstein, "image_index", 0);
    c_var_instance(jackenstein, "image_speed", 0);
    c_speaker("jackenstein");
    c_msgsetloc(0, "* JACK FEAR NO DANGER!!/", "obj_dw_churchc_finalclimb_slash_Step_0_gml_212_0");
    c_msgnextloc("* FRAINDS HELP JACK CLAIMB OUT OF PIT OF BAD FEELINGS AND LONELY NESTS/", "obj_dw_churchc_finalclimb_slash_Step_0_gml_213_0");
    c_msgnextloc("* JACK WILL HELP FRAINDS CLAIMB ANYTHING NOW!!/", "obj_dw_churchc_finalclimb_slash_Step_0_gml_214_0");
    c_facenext("susie", "D");
    c_msgnextloc("\\ED* ..^1. Not like we have another choice anyway./", "obj_dw_churchc_finalclimb_slash_Step_0_gml_216_0");
    c_facenext("jackenstein", 0);
    c_msgnextloc("* OKI TOKI ON MY SHOULDERS PLEASE :-)/%", "obj_dw_churchc_finalclimb_slash_Step_0_gml_218_0");
    c_talk();
    c_wait_box(4);
    c_sel(su);
    c_facing("r");
    c_sel(ra);
    c_facing("l");
    c_wait_talk();
    c_var_instance(jackenstein, "image_speed", 0.2);
    c_var_lerp_to_instance(jackenstein, "y", 2280, 10);
    c_wait(11);
    c_var_instance(jackenstein, "image_index", 0);
    c_var_instance(jackenstein, "image_speed", 0);
    c_pannable(1);
    c_pan(camerax(), 2020, 20);
    c_waitcustom();
}
if (con == 2 && customcon == 1 && !d_ex())
{
    con = 3;
    alarm[0] = 21;
    snd_play(snd_wing);
    with (jackenstein)
    {
        sprite_index = spr_npc_jackenstein_climb;
        scr_jump_to_point(x, 1980, 32, 20);
    }
}
if (con == 4 && customcon == 1)
{
    con = 5;
    customcon = 0;
    c_waitcustom_end();
    c_snd_play(snd_impact);
    c_customfunc(glass_row_crack, 4);
    c_customfunc(glass_row_shake, [4, 3]);
    c_shake();
    c_wait(15);
    c_sel(kr);
    c_autodepth(0);
    c_depth(jackenstein.depth - 10);
    c_walkdirect(kr_actor.x, 2205, 30);
    c_sel(su);
    c_autodepth(0);
    c_depth(jackenstein.depth - 11);
    c_walkdirect(su_actor.x, 2204, 30);
    c_sel(ra);
    c_autodepth(0);
    c_depth(jackenstein.depth - 12);
    c_walkdirect(ra_actor.x, 2207, 30);
    c_wait(30);
    c_wait(1);
    c_sel(kr);
    c_autowalk(0);
    c_sprite(spr_kris_climb_new);
    c_snd_play(snd_noise);
    c_addxy(18, 36);
    c_wait(2);
    var _krclimb = 40;
    c_lerp_var_instance(kr_actor, "image_index", 0, 8, _krclimb);
    c_walkdirect(jackenstein.x + 120, jackenstein.y + 120, _krclimb);
    c_delaycmd(_krclimb, "imagespeed", 0);
    c_delaycmd(_krclimb, "imageindex", 0);
    c_wait(15);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_climb);
    c_snd_play(snd_noise);
    c_addxy(0, -12);
    c_wait(2);
    var _climb1 = 20;
    var _climb2 = 7;
    var _climb3 = 15;
    c_lerp_var_instance(su_actor, "image_index", 0, 10, _climb1 + _climb2 + _climb3);
    c_walkdirect(278, 2128, _climb1);
    c_delaywalkdirect(_climb1, 278, 2110, _climb2);
    c_delaywalkdirect(_climb1 + _climb2, jackenstein.x + 50, jackenstein.y + 80, _climb3);
    c_delaycmd(_climb1 + _climb2 + _climb3, "imagespeed", 0);
    c_delaycmd(_climb1 + _climb2 + _climb3, "imageindex", 2);
    c_wait(10);
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_climb);
    c_snd_play(snd_noise);
    c_addxy(-2, -10);
    c_wait(2);
    var _raclimb1 = 15;
    var _raclimb2 = 25;
    c_lerp_var_instance(ra_actor, "image_index", 0, 10, _raclimb1 + _raclimb2);
    c_walkdirect(332, 2132, _raclimb1);
    c_delaywalkdirect(_raclimb1, jackenstein.x + 138, jackenstein.y + 80, _raclimb2);
    c_delaycmd(_raclimb1 + _raclimb2, "imagespeed", 0);
    c_delaycmd(_raclimb1 + _raclimb2, "imageindex", 2);
    c_wait(60);
    c_waitcustom();
}
if (con == 5 && customcon == 1 && !d_ex())
{
    if (global.interact == 1)
    {
        global.interact = 0;
        camera_y_pos = cameray();
        with (kr_actor)
            scr_stickto(obj_ch4_DCC00_jackenstein, -10);
        with (su_actor)
            scr_stickto(obj_ch4_DCC00_jackenstein, -11);
        with (ra_actor)
            scr_stickto(obj_ch4_DCC00_jackenstein, -11);
        with (obj_actor)
            visible = 0;
        with (obj_mainchara)
            freeze = 1;
        with (jackenstein)
        {
            start_climbing();
            sprite_index = spr_npc_jackenstein_climb_party;
        }
    }
    else
    {
        var finish = false;
        camera_y_pos = scr_movetowards(camera_y_pos, jackenstein.y - 160, 12);
        camera_set_view_pos(view_get_camera(0), camerax(), camera_y_pos);
        if (jackenstein.y <= 1200 && (floor(jackenstein.image_index) == 0 || floor(jackenstein.image_index) == 2))
        {
            finish = true;
            with (jackenstein)
                stop_climbing();
        }
        if (finish)
        {
            global.interact = 1;
            con = 8;
        }
    }
}
if (con == 8 && customcon == 1 && !d_ex())
{
    con = 9;
    customcon = 0;
    c_waitcustom_end();
    c_wait(15);
    c_speaker("jackenstein");
    c_msgsetloc(0, "* WALL BECOMES THIN HERE..^1. LET'S BE CAREFUL.../%", "obj_dw_churchc_finalclimb_slash_Step_0_gml_437_0");
    c_talk_wait();
    c_waitcustom();
}
if (con == 9 && customcon == 1 && !d_ex())
{
    if (global.interact == 1)
    {
        global.interact = 0;
        camera_y_pos = cameray();
        with (jackenstein)
        {
            climb_speed = 0.5;
            start_climbing();
        }
    }
    else
    {
        var finish = false;
        camera_y_pos = scr_movetowards(camera_y_pos, jackenstein.y - 120, 12);
        camera_set_view_pos(view_get_camera(0), camerax(), camera_y_pos);
        if (jackenstein.y <= 740)
        {
            jackenstein.y = 740;
            sword_controller.target_y_pos = glassheights[12] + 80;
            sword_controller.is_active = true;
            with (jackenstein)
                stop_climbing();
        }
        if (sword_controller.destroyed)
        {
            finish = true;
            with (obj_actor)
                visible = 1;
            glass_row_shake([12, 10]);
            glass_row_shake([11, 5]);
            glass_row_shake([10, 3]);
            glass_row_crack(12);
            scr_lerp_var_instance(id, "wobble", 0, 1, 30);
            with (jackenstein)
            {
                sprite_index = spr_npc_jackenstein_climb;
                image_index = 0;
                stop_climbing();
            }
        }
        if (finish)
        {
            global.interact = 1;
            con = 10;
        }
    }
}
if (con == 10 && customcon == 1 && !d_ex())
{
    con = recruit_version ? 19 : 11;
    alarm[0] = 30;
    snd_play(snd_impact);
    snd_play(snd_wing);
    with (jackenstein)
        start_slipping();
    scr_shakescreen();
}
if ((con == 12 && customcon == 1 && !d_ex()) || scr_cutscene_loaded())
{
    con = 13;
    customcon = 0;
    kris_down_face = false;
    c_waitcustom_end();
    c_mus2("initloop", "creepychase.ogg", 0);
    c_pan(camerax(), cameray() + 80, 30);
    c_wait(30);
    var _jacky = jackenstein.y;
    c_var_instance(jackenstein, "image_index", 1);
    c_lerp_var_instance(jackenstein, "y", _jacky, _jacky - 15, 10);
    c_wait(5);
    c_var_instance(jackenstein, "image_index", 2);
    c_lerp_var_instance(jackenstein, "y", _jacky - 15, _jacky - 38, 5);
    c_wait(5);
    c_customfunc(function()
    {
        glass_row_shake([11, 7]);
        snd_play(snd_wing, 1, 1.2);
        snd_play(snd_glass_crunch, 0.4, 1.2);
        glass_tile_shatter(glassrows[11][5]);
        glass_tile_shatter(glassrows[10][3], false);
        glass_tile_shatter(glassrows[10][0], false);
    });
    c_var_instance(jackenstein, "image_index", 3);
    c_lerp_var_instance(jackenstein, "y", _jacky - 38, _jacky - 48, 5);
    c_wait(5);
    c_wait(30);
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_climb_poses_alt);
    c_imageindex(1);
    c_sel(ra);
    c_sprite(spr_ralsei_climb_poses_alt);
    c_halt();
    c_speaker("susie");
    c_msgside("bottom");
    c_msgsetloc(0, "\\EZ* H-hey!/", "obj_dw_churchc_finalclimb_slash_Step_0_gml_582_0");
    c_facenext("jackenstein", 0);
    c_msgnextloc("* FRAINDS.../", "obj_dw_churchc_finalclimb_slash_Step_0_gml_584_0");
    c_msgnextloc("* IF JACK MOVE.../", "obj_dw_churchc_finalclimb_slash_Step_0_gml_585_0");
    c_msgnextloc("* WALL BREAK..^1. EVERYONE FALL DOWN.../", "obj_dw_churchc_finalclimb_slash_Step_0_gml_586_0");
    c_facenext("susie", "c");
    c_msgnextloc("\\Ec* The hell are we supposed to do^1, then.../", "obj_dw_churchc_finalclimb_slash_Step_0_gml_588_0");
    c_facenext("jackenstein", 0);
    c_msgnextloc("* ..^1. CLAIMB OFF JACK..^1. LEAVE JACK HERE.../", "obj_dw_churchc_finalclimb_slash_Step_0_gml_590_0");
    c_facenext("susie", "Z");
    c_msgnextloc("\\EZ* What? Hell if we're leaving you behind!/", "obj_dw_churchc_finalclimb_slash_Step_0_gml_592_0");
    c_facenext("ralsei", "b");
    c_msgnextloc("\\Eb* Susie.../", "obj_dw_churchc_finalclimb_slash_Step_0_gml_594_0");
    c_facenext("susie", "V");
    c_msgnextloc("\\EV* .../", "obj_dw_churchc_finalclimb_slash_Step_0_gml_596_0");
    c_facenext("ralsei", "8");
    c_msgnextloc("\\E8* We..^1. We just have to be realistic./", "obj_dw_churchc_finalclimb_slash_Step_0_gml_598_0");
    c_facenext("susie", "V");
    c_msgnextloc("\\EV* .../", "obj_dw_churchc_finalclimb_slash_Step_0_gml_600_0");
    c_facenext("ralsei", "e");
    c_msgnextloc("\\Ee* Let's just..^1. Climb off. Carefully./%", "obj_dw_churchc_finalclimb_slash_Step_0_gml_602_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_imageindex(0);
    c_wait_box(2);
    c_var_instance(jackenstein, "sprite_index", spr_npc_jackenstein_climb_look_left);
    c_wait_box(3);
    c_var_instance(jackenstein, "sprite_index", spr_npc_jackenstein_climb);
    c_wait_box(4);
    c_var_instance(jackenstein, "sprite_index", spr_npc_jackenstein_climb_look_down);
    c_wait_box(6);
    c_var_instance(jackenstein, "sprite_index", spr_npc_jackenstein_climb_look_left);
    c_sel(su);
    c_imageindex(1);
    c_wait_box(8);
    c_var_instance(jackenstein, "sprite_index", spr_npc_jackenstein_climb);
    c_wait_box(10);
    c_sel(su);
    c_imageindex(0);
    c_wait_box(12);
    c_sel(ra);
    c_imageindex(1);
    c_wait_box(16);
    c_sel(ra);
    c_imageindex(0);
    c_wait_talk();
    c_sel(kr);
    c_stickto_stop();
    c_sel(ra);
    c_stickto_stop();
    c_sel(su);
    c_stickto_stop();
    c_customfunc(function()
    {
        with (obj_actor)
            visible = 0;
        ra_wobble_marker = scr_dark_marker_fancy(ra_actor.x, ra_actor.y, ra_actor.sprite_index);
        su_wobble_marker = scr_dark_marker_fancy(su_actor.x, su_actor.y, su_actor.sprite_index);
        kr_wobble_marker = scr_dark_marker_fancy(kr_actor.x, kr_actor.y, kr_actor.sprite_index);
        with (ra_wobble_marker)
            ref_actor = other.ra_actor;
        with (su_wobble_marker)
            ref_actor = other.su_actor;
        with (kr_wobble_marker)
            ref_actor = other.kr_actor;
        with (obj_marker_fancy)
        {
            if (variable_instance_exists(id, "ref_actor"))
            {
                end_step_func = function()
                {
                    x = floor(ref_actor.x) + obj_dw_churchc_finalclimb.wobblex;
                    y = ref_actor.y;
                    sprite_index = ref_actor.sprite_index;
                    image_index = ref_actor.image_index;
                    depth = ref_actor.depth - 2;
                    if (ref_actor.visible)
                        visible = false;
                    else
                        visible = true;
                };
            }
        }
    });
    c_sel(ra);
    c_autodepth(0);
    c_autowalk(0);
    c_wait(1);
    c_wait(10);
    c_sprite(spr_ralsei_climb);
    c_imageindex(0);
    c_lerp_var_instance(ra_actor, "image_index", 1, 12, 55);
    c_walkdirect(363, 859, 15);
    c_delaywalkdirect(15, 363, 809, 20);
    c_delaywalkdirect(35, 350, 798, 20);
    c_delaycmd(65, "sprite", spr_ralsei_climb_poses);
    c_delaycmd(65, "imageindex", 2);
    c_delaycmd(80, "sprite", spr_ralsei_climb);
    c_delaycmd(80, "imageindex", 0);
    c_delaycmd4(90, "walkdirect", 342, 696, 50, 0);
    c_delay_customfunc(90, function()
    {
        scr_lerp_instance_var(ra_actor, "image_index", 1, 12, 50);
    });
    c_sel(kr);
    c_autodepth(0);
    c_autowalk(0);
    c_sprite(spr_kris_climb_new);
    c_lerp_var_instance(kr_actor, "image_index", 1, 3, 15);
    c_walkdirect(kr_actor.x, 886, 15);
    c_delaycmd(15, "sprite", spr_kris_climb_new_charge);
    c_delay_customfunc(15, function()
    {
        scr_lerp_instance_var(kr_actor, "image_index", 0, 2, 15);
    });
    c_delaycmd(30, "sprite", spr_kris_climb_new_jump_up);
    c_delaycmd(30, "imageindex", 0);
    c_delaycmd(30, "imagespeed", 0.4);
    c_delaycmd4(30, "walkdirect", kr_actor.x, 836, 10, 0);
    c_delaycmd(40, "sprite", spr_kris_climb_new);
    c_delaycmd(40, "imagespeed", 0);
    c_delaycmd(40, "imageindex", 0);
    c_delaycmd4(40, "addxy", 0, -12, 0, 0);
    c_delaycmd(40, "soundplay", snd_noise);
    c_delaycmd4(50, "walkdirect", kr_actor.x, 720, 60, 0);
    c_delaycmd(50, "imagespeed", 0.2);
    c_delaycmd4(50, "pan", camerax(), cameray() - 100, 60, 0);
    c_delaycmd(110, "imagespeed", 0);
    c_sel(su);
    c_autodepth(0);
    c_autowalk(0);
    c_sprite(spr_susie_climb_poses_alt);
    c_imageindex(3);
    c_delaycmd(30, "sprite", spr_susie_climb);
    c_delaycmd4(30, "walkdirect", su_actor.x, 835, 20, 0);
    c_delay_customfunc(30, function()
    {
        scr_lerp_instance_var(su_actor, "image_index", 2, 6, 20);
    });
    c_delaycmd(55, "sprite", spr_susie_climb_poses_alt);
    c_delaycmd(55, "imageindex", 1);
    c_delaycmd(70, "sprite", spr_susie_climb);
    c_delaycmd(70, "imageindex", 2);
    c_delaycmd(75, "sprite", spr_susie_jump_up);
    c_delaycmd4(75, "walkdirect", su_actor.x, 765, 10, 0);
    c_delaycmd(75, "imagespeed", 0.4);
    c_delaycmd(85, "soundplay", snd_noise);
    c_delaycmd(85, "sprite", spr_susie_climb);
    c_delaycmd(85, "imageindex", 3);
    c_delaycmd(85, "imagespeed", 0);
    c_delaycmd(100, "imagespeed", 0.2);
    c_delaycmd(100, "imageindex", 4);
    c_delaycmd4(100, "walkdirect", su_actor.x, 720, 30, 0);
    c_delaycmd(130, "imagespeed", 0);
    c_sel(kr);
    c_wait_if(kr_actor, "y", "<", 800);
    c_visible(true);
    c_sel(ra);
    c_wait_if(ra_actor, "y", "<", 765);
    c_visible(true);
    c_sel(su);
    c_wait_if(su_actor, "y", "<", 765);
    c_visible(true);
    c_wait(40);
    c_msgside("top");
    c_speaker("jackenstein");
    c_msgsetloc(0, "* JACK..^1. STAY HERE..^1. VERY STILL./", "obj_dw_churchc_finalclimb_slash_Step_0_gml_824_0");
    c_facenext("ralsei", "8");
    c_msgnextloc("\\E8* Sorry^1, Jack..^1. We'll seal the fountain as fast as we can./%", "obj_dw_churchc_finalclimb_slash_Step_0_gml_826_0");
    c_talk_wait();
    c_wait(30);
    c_sel(kr);
    c_imagespeed(0.2);
    c_walkdirect(kr_actor.x, 664, 60);
    c_sel(su);
    c_imagespeed(0.2);
    c_walkdirect(su_actor.x, 664, 60);
    c_sel(ra);
    c_imagespeed(0.2);
    c_walkdirect(ra_actor.x, 634, 60);
    c_wait(30);
    c_var_instance(sword_controller, "target_y_pos", jackenstein.y + 100);
    c_var_instance(sword_controller, "is_active", true);
    c_mus("free_all");
    c_wait_if(sword_controller, "destroyed", "=", true);
    c_customfunc(function()
    {
        with (jackenstein)
            scr_shakeobj_x(20);
        wobble = 0;
        layer_x(glasslayers[10], 0);
        layer_x(glasslayers[11], 0);
        glass_row_shatter(10);
        glass_row_shatter(11, false);
    });
    c_sel(kr);
    c_halt();
    c_sel(su);
    c_halt();
    c_sel(ra);
    c_halt();
    c_wait(15);
    c_waitcustom();
}
if (con == 13 && customcon == 1 && !d_ex())
{
    con = 15;
    snd_play(snd_wing);
    with (jackenstein)
        start_falling();
}
if (con == 15 && customcon == 1 && !d_ex())
{
    con = 16;
    customcon = 0;
    c_waitcustom_end();
    c_sel(su);
    c_sprite(spr_susie_climb_poses);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(2);
    c_sel(ra);
    c_sprite(spr_ralsei_climb_poses);
    c_halt();
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\Ed* JACK!!!/%", "obj_dw_churchc_finalclimb_slash_Step_0_gml_909_0");
    c_talk_wait();
    c_sel(ra);
    c_imageindex(1);
    c_wait(30);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E4* .../", "obj_dw_churchc_finalclimb_slash_Step_0_gml_919_0");
    c_facenext("susie", 31);
    c_msgnextloc("\\EV* Damn it.../", "obj_dw_churchc_finalclimb_slash_Step_0_gml_921_0");
    c_msgnextloc("\\EU* We..^1. We didn't see him land or anything/", "obj_dw_churchc_finalclimb_slash_Step_0_gml_922_0");
    c_msgnextloc("\\EU* You think there's any chance..^1. He's still okay?/", "obj_dw_churchc_finalclimb_slash_Step_0_gml_923_0");
    c_msgnextloc("\\EU* Ralsei^1, what do you think?/", "obj_dw_churchc_finalclimb_slash_Step_0_gml_924_0");
    c_facenext("ralsei", "e");
    c_msgnextloc("\\Ee* I.../", "obj_dw_churchc_finalclimb_slash_Step_0_gml_926_0");
    c_msgnextloc("\\Ef* .../", "obj_dw_churchc_finalclimb_slash_Step_0_gml_927_0");
    c_facenext("susie", 31);
    c_msgnextloc("\\EV* That/", "obj_dw_churchc_finalclimb_slash_Step_0_gml_929_0");
    c_msgnextloc("\\EV* Goddamn knight.../", "obj_dw_churchc_finalclimb_slash_Step_0_gml_930_0");
    c_msgnextloc("\\EI* That GODDAMN KNIGHT!!!/%", "obj_dw_churchc_finalclimb_slash_Step_0_gml_931_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_imageindex(1);
    c_wait_box(3);
    c_sel(su);
    c_imageindex(0);
    c_wait_box(4);
    c_sel(su);
    c_imageindex(3);
    c_wait_box(5);
    c_sel(su);
    c_imageindex(0);
    c_sel(ra);
    c_imageindex(0);
    c_wait_box(7);
    c_sel(ra);
    c_imageindex(1);
    c_wait_box(10);
    c_sel(su);
    c_imageindex(0);
    c_wait_box(12);
    c_sel(su);
    c_shakeobj();
    c_wait_talk();
    c_sel(su);
    c_snd_play(snd_noise);
    c_sprite(spr_susie_climb);
    c_imagespeed(0.4);
    c_walkdirect(su_actor.x, cameray() - 200, 60);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EC* Susie^1, don't climb so fast!!/%", "obj_dw_churchc_finalclimb_slash_Step_0_gml_975_0");
    c_talk();
    c_wait(60);
    c_wait_talk();
    c_sel(ra);
    c_snd_play(snd_noise);
    c_sprite(spr_ralsei_climb);
    c_imagespeed(0.4);
    c_walkdirect(ra_actor.x, cameray() - 200, 60);
    c_wait(60);
    c_sel(su);
    c_visible(0);
    c_sel(ra);
    c_visible(0);
    c_customfunc(function()
    {
        with (obj_marker_fancy)
            instance_destroy();
    });
    c_sel(kr);
    c_imagespeed(0.2);
    c_walkdirect(kr_actor.x, 360, 120);
    c_wait(120);
    c_halt();
    c_wait(1);
    c_setxy(kr_actor.x - 16, 200);
    c_sprite(spr_kris_stand_from_kneel_up);
    c_imageindex(0);
    c_pan(camerax(), 0, 140);
    c_wait(140);
    c_lerp_var_instance(kr_actor, "image_index", 0, 4, 30);
    c_wait(45);
    c_autowalk(1);
    c_walk("u", 4, 95);
    c_wait(95);
    c_var_instance(id, "con", 50);
    c_waitcustom();
}
if (con == 20 && customcon == 1 && !d_ex())
{
    con = 21;
    customcon = 0;
    var _wall_cover = scr_dark_marker(200, jackenstein.y - 40, spr_blank_tile_black);
    with (_wall_cover)
    {
        image_xscale = 6;
        image_yscale = 2;
        depth = 999990;
        visible = 0;
    }
    c_waitcustom_end();
    c_mus2("initloop", "creepychase.ogg", 0);
    c_pan(camerax(), 740, 30);
    c_sel(su);
    c_sprite(spr_susie_climb_poses_alt);
    c_imageindex(1);
    c_sel(ra);
    c_sprite(spr_ralsei_climb_poses_alt);
    c_imageindex(2);
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_climb_poses_alt);
    c_imageindex(0);
    c_sel(ra);
    c_sprite(spr_ralsei_climb_poses_alt);
    c_imageindex(0);
    c_speaker("jackenstein");
    c_msgsetloc(0, "* NO WORRY..^1. JACK JUST HANG ON AND.../%", "obj_dw_churchc_finalclimb_slash_Step_0_gml_1076_0");
    c_talk_wait();
    c_mus("free_all");
    c_var_instance(sword_controller, "is_active", true);
    c_var_instance(sword_controller, "target_y_pos", 835);
    c_var_instance(sword_controller, "flip_side", false);
    c_var_instance(sword_controller_b, "is_active", true);
    c_var_instance(sword_controller_b, "target_y_pos", 1085);
    c_var_instance(sword_controller_b, "flip_side", true);
    c_wait_if(sword_controller, "destroyed", "=", true);
    c_customfunc(function()
    {
        wobble = 0;
        layer_x(glasslayers[10], 0);
        layer_x(glasslayers[11], 0);
        glass_row_shatter(11, true, 1);
        glass_row_shatter(10, false, 1);
    });
    c_wait(8);
    c_customfunc(function()
    {
        snd_play(snd_wing);
        falling_sound = snd_play(snd_closet_fall);
        with (jackenstein)
            start_falling();
    });
    c_wait(1);
    c_shake();
    c_waitcustom();
}
if (con == 21 && customcon == 1)
{
    con = 22;
    with (cup_stack)
    {
        visible = 0;
        y += 300;
    }
}
if (con == 22 && customcon == 1 && !d_ex())
{
    con = 23;
    camera_y_pos = cameray();
    var pan_time = round(point_distance(camerax(), cameray(), camerax(), cup_top_y_pos) / 18);
    scr_lerpvar("camera_y_pos", cameray(), cup_top_y_pos, pan_time, 3, "inout");
}
if (con == 23)
{
    camera_set_view_pos(view_get_camera(0), camerax(), camera_y_pos);
    if (cameray() >= cup_top_y_pos)
        con = 24;
}
if (con == 24 && customcon == 1 && !d_ex())
{
    con = 26;
    customcon = 0;
    c_waitcustom_end();
    c_wait(75);
    c_customfunc(function()
    {
        snd_stop(falling_sound);
    });
    c_sound_play(snd_noise);
    c_wait(45);
    c_var_instance(jackenstein, "visible", false);
    c_var_instance(cup_stack, "visible", 1);
    c_var_lerp_to_instance(cup_stack, "y", cup_stack.ystart, 60);
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\EZ* You guys..^1. The hell are you doing here!?/%", "obj_dw_churchc_finalclimb_slash_Step_0_gml_1166_0");
    c_talk_wait();
    c_mus2("initloop", "gerson_theme_nointro.ogg", 0);
    c_speaker("no_name");
    c_msgsetloc(0, "* We apologize for our belated realization.../", "obj_dw_churchc_finalclimb_slash_Step_0_gml_1175_0");
    c_msgnextloc("* But you three are the heroes^1, are you not!?/", "obj_dw_churchc_finalclimb_slash_Step_0_gml_1176_0");
    c_msgnextloc("* The story of your kindness..^1. Has become legendary!!/%", "obj_dw_churchc_finalclimb_slash_Step_0_gml_1177_0");
    c_talk_wait();
    c_waitcustom();
}
if (con == 26 && customcon == 1 && !d_ex())
{
    con = 27;
    camera_y_cache = cameray();
    camera_y_pos = cameray();
    var pan_time = round(point_distance(camerax(), cameray(), camerax(), cup_bottom_y_pos) / 18);
    scr_lerpvar("camera_y_pos", cameray(), cup_bottom_y_pos, pan_time, 3, "inout");
}
if (con == 27)
{
    camera_set_view_pos(view_get_camera(0), camerax(), camera_y_pos);
    if (cameray() >= cup_bottom_y_pos)
    {
        con = 28;
        alarm[0] = 30;
    }
}
if (con == 29 && customcon == 1 && !d_ex())
{
    con = 30;
    var pan_time = round(point_distance(camerax(), cameray(), camerax(), camera_y_cache) / 18);
    scr_lerpvar("camera_y_pos", cameray(), camera_y_cache, pan_time, 3, "inout");
}
if (con == 30)
{
    camera_set_view_pos(view_get_camera(0), camerax(), camera_y_pos);
    if (cameray() <= camera_y_cache)
    {
        con = 31;
        alarm[0] = 30;
    }
}
if (con == 32 && customcon == 1 && !d_ex())
{
    con = 33;
    customcon = 0;
    c_waitcustom_end();
    c_speaker("no_name");
    c_msgsetloc(0, "* And so^1, posthaste^1, we come to aid you in your battle.../", "obj_dw_churchc_finalclimb_slash_Step_0_gml_1241_0");
    c_msgnextloc("* Go forth..^1. and defeat the Knight!/%", "obj_dw_churchc_finalclimb_slash_Step_0_gml_1242_0");
    c_talk_wait();
    c_var_instance(cup_stack, "con", 1);
    c_wait(30);
    c_snd_play(snd_wing);
    c_wait(40);
    c_var_instance(cup_stack, "jack_index", 1);
    c_snd_play(snd_jump);
    c_sel(kr);
    c_autodepth(0);
    c_stickto_stop();
    c_sprite(spr_kris_fall_ball);
    c_imagespeed(0.4);
    c_setxy(290, cup_top_y_pos + 200);
    c_visible(1);
    c_jump(300, 167, 24, 70);
    c_delaycmd(71, "sprite", spr_krisd_dark);
    c_delaycmd(71, "imagespeed", 0);
    c_sel(su);
    c_autodepth(0);
    c_stickto_stop();
    c_sprite(spr_susie_dw_fall_ball);
    c_imagespeed(0.4);
    c_setxy(244, cup_top_y_pos + 200);
    c_visible(1);
    c_jump(244, 172, 24, 80);
    c_delaycmd(81, "sprite", spr_susie_walk_down_dw);
    c_delaycmd(81, "imagespeed", 0);
    c_sel(ra);
    c_autodepth(0);
    c_stickto_stop();
    c_sprite(spr_ralsei_jump_ball);
    c_imagespeed(0.4);
    c_setxy(347, cup_top_y_pos + 200);
    c_visible(1);
    c_jump(347, 177, 24, 80);
    c_delaycmd(81, "sprite", spr_ralsei_walk_down);
    c_delaycmd(81, "imagespeed", 0);
    var pan_time = round(point_distance(camerax(), cameray(), camerax(), 0) / 28);
    c_pan(camerax(), 0, pan_time);
    c_wait(71);
    c_snd_play(snd_wing);
    c_wait(10);
    c_snd_play(snd_wing);
    c_wait(30);
    c_sel(ra);
    c_sprite(spr_ralsei_wave_start);
    c_lerp_var_instance(ra_actor, "image_index", 0, 2, 8);
    c_delaycmd(12, "sprite", spr_ralsei_wave_down);
    c_delaycmd(12, "imagespeed", 0.2);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E2* Everyone..^1. thank you so much!/", "obj_dw_churchc_finalclimb_slash_Step_0_gml_1310_0");
    c_facenext("susie", 9);
    c_msgnextloc("\\E9* Heh^1, guess being nice kinda pays off...!/", "obj_dw_churchc_finalclimb_slash_Step_0_gml_1312_0");
    c_msgnextloc("\\E2* Now let's go kick that Knight's ass!/%", "obj_dw_churchc_finalclimb_slash_Step_0_gml_1313_0");
    c_talk();
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_pose);
    c_wait_talk();
    c_mus2("volume", 0, 60);
    c_sel(su);
    c_facing("r");
    c_halt();
    c_sel(ra);
    c_facing("l");
    c_halt();
    c_panobj(kr_actor, 20);
    c_wait(21);
    c_var_instance(id, "con", 50);
    c_waitcustom();
}
if (con == 50 && !d_ex() && customcon == 1)
{
    con = 60;
    customcon = 0;
    global.facing = 0;
    with (obj_mainchara)
        freeze = 0;
    c_waitcustom_end();
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    if (recruit_version)
        c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 60 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = kris_down_face ? 0 : 2;
    with (obj_mainchara)
        cutscene = 0;
    global.plot = 245;
    scr_flag_set(7, 0);
    scr_tempsave();
}
