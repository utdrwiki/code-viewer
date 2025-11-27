vent_cover_marker = scr_marker(88, 37, spr_noellehouse_vent_open_cover);
vent_closed_cover_marker = scr_marker(88, 37, spr_noellehouse_vent_closed_cover);
vent_closed_cover_marker.visible = 0;
vent_panel_marker = scr_marker(80, 37, spr_pixel_white);
vent_panel_marker.image_blend = #F6F9F2;
vent_panel_marker.image_xscale = 3;
vent_panel_marker.image_yscale = 4;
if (global.plot <= 60)
{
    instance_create(0, 0, obj_musicer_noellehouse);
}
else
{
    with (obj_savepoint)
        instance_destroy();
}
if (global.plot < 63)
{
    with (vent_cover_marker)
        instance_destroy();
    with (vent_panel_marker)
        instance_destroy();
    instance_destroy();
    exit;
}
else if (global.plot == 63)
{
    if (scr_sideb_active())
    {
        var cover_marker = scr_marker(120, 220, spr_pixel_white);
        with (cover_marker)
        {
            depth = 999990;
            image_xscale = 10;
            image_yscale = 10;
            image_blend = #201E33;
        }
        var cover_block = instance_create(cover_marker.x, cover_marker.y, obj_homealone_solid);
        with (cover_block)
        {
            image_xscale = 2;
            image_yscale = 2;
        }
        instance_destroy();
        exit;
    }
}
init = false;
room_offset_x = 40;
room_offset_y = 20;
kris_marker = scr_marker(197 + room_offset_x, 109 + room_offset_y, spr_noellehouse_kitchen_kris_choco_start_make);
with (kris_marker)
{
    depth = 98000;
    image_speed = 0;
}
choco_marker = instance_create(204 + room_offset_x, 136 + room_offset_y, obj_homealone_kitchen_choco);
choco_marker.visible = 0;
cup_marker = scr_marker(kris_marker.x, kris_marker.y, spr_noellehouse_kitchen_drink);
cup_marker.visible = 0;
cup_marker.depth = kris_marker.depth - 10;
drink_finished = false;
drink_start_pause = 60;
drink_make_timer = 0;
drink_track = false;
if (scr_flag_get(1643) >= 3)
{
    drink_finished = true;
    cup_marker.visible = 1;
    kris_drink_down = true;
    piano_sequence = scr_flag_get(737) > 0;
    with (kris_marker)
    {
        sprite_index = spr_noellehouse_kitchen_kris_sleep;
        image_index = 3;
    }
}
else
{
    scr_flag_set(1643, scr_flag_get(1643) + 1);
}
sink_notice_timer = 15;
sink_marker = scr_marker(157, 83, spr_noellehouse_kitchen_sink_water);
with (sink_marker)
{
    scr_depth();
    image_speed = 0.15;
    visible = 0;
}
grab_heart = false;
grab_heart_timer = 0;
grab_jump_timer = 0;
screen_dark = false;
piano_sequence = false;
piano_pause_timer = 0;
piano_song[0] = -4;
piano_song[1] = -4;
piano_playlist = ["kris_piano_sevenfour", "kris_piano_quiz", "kris_piano_lancer_waltz", "kris_piano_rouxls", "kris_piano_waitingroom", "kris_piano_shop", "kris_piano_last_prophecy", "kris_piano_prophecy"];
piano_index = scr_flag_get(738);
emitter = audio_emitter_create();
jump_pos = 0;
jump_timer = 10;
jump_slow = false;
test_timer = 0;
if (scr_flag_get(737) == 0)
{
    is_noticed = false;
    hit_heart = false;
    notice_timer = 0;
    heart_fall_timer = 0;
    kris_face_left = true;
    finished = false;
    walk_speed = 2;
    move_towards_heart = false;
    get_time = 0;
    move_timer = 0;
    heart_fall_ypos = 0;
    kris_get = false;
    kris_get_timer = 0;
    heart_take = false;
    heart_take_timer = 0;
    kris_turn_pos = kris_marker.x + 20;
    kris_throw = false;
    kris_throw_timer = 0;
    kris_drink_down = false;
    heart_aligned = false;
    move_up = false;
    move_right = false;
    debug_reset = false;
    debug_reset_timer = 0;
    throw_threshold_x_a = 140;
    throw_threshold_xx_a = 380;
    throw_threshold_y_a = 70;
    throw_threshold_yy_a = 190;
    throw_threshold_x_b = 180;
    throw_threshold_xx_b = 300;
    throw_threshold_y_b = 0;
    throw_threshold_yy_b = 190;
}
else
{
    piano_sequence = true;
    vent_closed_cover_marker.visible = 1;
    vent_bottom_collider = instance_create(85, 50, obj_homealone_solid);
    vent_bottom_collider.image_xscale = 2;
    piano_aligned = false;
    piano_play = false;
    piano_timer = 0;
    piano_time = 0;
    if (scr_flag_get(787) >= 1)
    {
        kris_marker.sprite_index = spr_noellehouse_kitchen_kris_look_phone;
        drink_finished = true;
        cup_marker.visible = 1;
        choco_marker.visible = 1;
    }
    if (scr_flag_get(787) > 1)
    {
        if (scr_flag_get(787) == 2)
        {
            kris_marker.x = 140;
            kris_marker.sprite_index = spr_krisl;
            kris_marker.image_speed = 0.25;
            piano_pause_timer = 90;
        }
        if (scr_flag_get(787) == 3)
        {
            kris_marker.x = 140;
            kris_marker.y = 170;
            kris_marker.sprite_index = spr_krisd;
            kris_marker.image_speed = 0.25;
            piano_pause_timer = 90;
        }
        if (scr_flag_get(787) == 4)
        {
            piano_play = true;
            piano_aligned = true;
            kris_marker.visible = 0;
        }
    }
    if (scr_flag_get(787) == 0)
        scr_flag_set(787, 1);
}
