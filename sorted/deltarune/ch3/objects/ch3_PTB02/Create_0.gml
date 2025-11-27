con = -1;
customcon = 0;
depth = 500;
visible = true;
camera_lock = false;
camera_block = -4;
teamdefeated = true;
if (scr_debug())
    moveinit = 0;
if (global.plot >= 310 && global.plot < 330)
{
    con = 0;
    tree_marker = scr_dark_marker(1920, -200, spr_dw_snow_zone_tree);
    with (tree_marker)
        scr_depth();
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = -110;
    blackall.image_blend = c_black;
    blackall.visible = 0;
    whiteall = scr_dark_marker(-10, -10, spr_pixel_white);
    whiteall.image_xscale = 999;
    whiteall.image_yscale = 999;
    whiteall.depth = -110;
    whiteall.image_blend = c_white;
    whiteall.visible = 0;
    roaring_knight_appear = false;
    roaring_knight = -4;
    roaring_knight_fx = false;
    roaring_knight_turn = false;
    roaring_knight_bird = false;
    roaring_knight_waver = false;
    roaring_knight_waver_timer = 0;
    roaring_knight_waver_siner = 0;
    roaring_knight_hurt_pos = 0;
    roaring_knight_warp = false;
    roaring_knight_warp_timer = 0;
    roaring_knight_warp_cache = 0;
    roaring_knight_warp_start = false;
    roaring_knight_beam = -4;
    roaring_knight_beam_start = false;
    roaring_knight_beam_stop = false;
    roaring_knight_state = 0;
    bird_loop = false;
    bird_loop_timer = 10;
    bird_pitch = 0.6;
    bird_volume_multiplier = 1;
    tenna_hurt = false;
    susie_slash = false;
    susie_slash_timer = 0;
    susie_knight_slash = false;
    susie_knight_slash_timer = 0;
    susie_knight_shake_timer = 0;
    susie_knight_shake_time = 80;
    susie_knight_shake_sequence = false;
    slash_show = false;
    spear_throw = false;
    spear_throw_timer = 0;
    spear_dodge = false;
    spear_dodge_timer = 0;
    spear_throw_x = 0;
    spear_throw_y = 0;
    spear_throw_count = 0;
    spear_dodge_count = 0;
    spear_dodge_timer = 0;
    spear_throw_time = 24;
    current_spear = -4;
    ball_can_move = true;
    spear_throw_start = false;
    spear_throw_stop = false;
    spear_throw_controller = -4;
    make_npcs = false;
    toriel_grab = false;
    toriel_grab_timer = 0;
    toriel_grab_x = 0;
    toriel_grab_y = 0;
    camera_pan = false;
    camera_pan_timer = 0;
    camera_x_pos = 2720;
    camera_pan_back = false;
    overlay_pulse = false;
    overlay_alpha = 0;
    overlay_siner = 0;
    knight_marker = -4;
    piece_marker = -4;
    sword_shiny = -4;
    sword_shiny_readable = -4;
    remove_shiny = false;
    white_slash = scr_dark_marker(0, 0, spr_roaringknight_slash_white_horizontal);
    white_slash.visible = 0;
    sword_draw = false;
    sword_draw_index = 0;
    sword_draw_timer = 0;
    sword_draw_timestamps = [8, 1, 6, 6, 6, 6, 1, 2, 2, 6, 2, 8];
    sword_draw_ready = false;
    big_shake = false;
    unskip_writer = false;
    susie_marker = -4;
    susie_hide = false;
    susie_shadow = 0;
    grand_door_offset = 1200;
    grand_door = scr_dark_marker(7300 - grand_door_offset, 10, spr_giantdarkdoor_white);
    with (grand_door)
    {
        scr_depth();
        image_alpha = 0;
    }
    left_exit_block = -4;
    te_actor = -4;
    var spear_list = [spr_undyne_dw_spear_ground_0, spr_undyne_dw_spear_ground_1, spr_undyne_dw_spear_ground_2];
    for (var i = 0; i < 25; i++)
    {
        var spear_sprite = spear_list[irandom(array_length(spear_list) - 1)];
        var spear = scr_dark_marker(3490 + (i * 80) + irandom(20), cameray() + 240 + irandom(90), spear_sprite);
        with (spear)
            scr_depth();
        spear.depth += 240;
        var x_offset = 0;
        if (spear_sprite == 3889)
            x_offset = 10;
        var spear_block = instance_create(spear.x + x_offset, spear.y + 20, obj_solidblocksized);
        with (spear_block)
        {
            image_xscale = 0.5;
            image_yscale = 0.5;
        }
    }
    if (global.tempflag[90] > 0)
    {
        global.interact = 1;
        global.darkzone = 1;
        if (i_ex(obj_ch3_PTB02_roaringknight))
        {
            with (obj_ch3_PTB02_roaringknight)
                instance_destroy();
        }
        roaring_knight = instance_create(2655, cameray() + 106, obj_ch3_PTB02_roaringknight);
        with (roaring_knight)
        {
            sprite_index = spr_roaringknight_idle_overworld_sword;
            image_speed = 0.1;
            scr_depth();
            sword_active = true;
        }
        with (obj_mainchara)
        {
            x = 2356;
            y = 104;
            cutscene = 1;
        }
        camera_set_view_pos(view_get_camera(0), 2230, cameray());
        with (obj_mainchara)
            cutscene = 1;
        toriel_gacha = instance_create(2062, 160, obj_ch3_PTB02_toriel);
        toriel_gacha.depth = tree_marker.depth - 10;
        toriel_gacha.ball_open = true;
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        if (global.tempflag[90] == 1)
        {
            con = 10;
            blackall.visible = 1;
            c_var_lerp_to_instance(blackall, "image_alpha", 0, 30);
            un = actor_count + 2;
            un_actor = instance_create(2255, cameray() - 200, obj_actor);
            scr_actor_setup(un, un_actor, "undyne");
            un_actor.sprite_index = spr_undyne_dw_spear_point;
            tree_marker.visible = 0;
            roaring_knight.state = 0;
            roaring_knight.sword_active = true;
            roaring_knight.grab_hand = false;
            c_sel(kr);
            c_sprite(spr_krisb_defeat);
            c_sel(ra);
            c_setxy(2288, 190);
            c_sprite(spr_ralsei_defeat);
            c_sel(su);
            c_setxy(2310, 142);
            c_sprite(spr_susie_dw_fell);
            c_wait(90);
            c_waitcustom();
        }
        else if (global.tempflag[90] == 2)
        {
            con = 50;
            un = actor_count + 2;
            un_actor = instance_create(2255, cameray() - 200, obj_actor);
            scr_actor_setup(un, un_actor, "undyne");
            un_actor.sprite_index = spr_undyne_dw_spear_point;
            tree_marker.visible = 0;
            roaring_knight.sprite_index = spr_roaringknight_idle;
            whiteall.visible = 1;
        }
        else if (global.tempflag[90] == 3)
        {
            con = 11;
            tree_marker.visible = 0;
            roaring_knight.visible = 0;
            roaring_knight.after_active = false;
            c_sel(kr);
            c_sprite(spr_krisb_defeat);
            c_sel(ra);
            c_setxy(2227, 248);
            c_sprite(spr_ralsei_kneel_serious);
            c_sel(su);
            c_visible(0);
            c_waitcustom();
        }
        else if (global.tempflag[90] == 4)
        {
            con = 3;
            whiteall.visible = 1;
            tree_marker.visible = 0;
            un = actor_count + 2;
            un_actor = instance_create(2255, cameray() - 200, obj_actor);
            scr_actor_setup(un, un_actor, "undyne");
            un_actor.sprite_index = spr_undyne_dw_spear_point;
            c_var_lerp_to_instance(whiteall, "image_alpha", 0, 30);
            var shorten = false;
            if (variable_global_exists("knight_battle_losses"))
                shorten = global.knight_battle_losses > 1;
            c_sel(ra);
            c_autowalk(0);
            c_sprite(spr_ralsei_walk_right_unhappy);
            c_setxy(2288, 190);
            c_sel(su);
            c_autowalk(0);
            c_sprite(spr_susie_idle_serious);
            c_setxy(2310, 142);
            c_sel(kr);
            c_sprite(spr_krisb_idle);
            c_setxy(2356, 104);
            c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_idle_overworld);
            c_var_instance(roaring_knight, "state", 0);
            if (shorten)
                con = 3.1;
            c_wait(60);
            c_waitcustom();
        }
    }
}
else
{
    instance_destroy();
}
tennawhite = 0;
drawbot = false;
tennaslash = 0;
swoon_target = -4;

swoon_display = function(arg0)
{
    var dmgwriter = instance_create(arg0.x + 20, arg0.y + 30, obj_dmgwriter);
    with (dmgwriter)
        type = 12;
};

show_clash_overlay = function(arg0 = 8, arg1 = 1)
{
    var _clash_overlay = scr_dark_marker(-10, -10, spr_pixel_white);
    _clash_overlay.image_xscale = 999;
    _clash_overlay.image_yscale = 999;
    _clash_overlay.depth = -110;
    _clash_overlay.image_blend = c_white;
    _clash_overlay.image_alpha = 0;
    _clash_overlay.visible = 1;
    scr_lerp_instance_var(_clash_overlay, "image_alpha", 0, arg1, arg0, 2, "out");
    scr_script_delayed(scr_lerp_instance_var, arg0 + 2, _clash_overlay, "image_alpha", arg1, 0, arg0, 2, "out");
    scr_doom(_clash_overlay, arg0 + arg0 + 2);
};
