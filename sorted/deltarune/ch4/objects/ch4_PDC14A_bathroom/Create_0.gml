con = -1;
customcon = 0;
side_b = scr_sideb_active();
if (!side_b)
{
    instance_destroy();
}
else if (global.plot != 90)
{
    instance_destroy();
}
else
{
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.visible = 1;
    with (obj_noellehouse_bathroom)
        trashcan_marker.visible = 0;
    trashcan = scr_marker(221, 173, spr_trashcan_damage_side_b);
    with (trashcan)
        scr_depth();
    trash_shake = false;
    trash_hit = false;
    trash_hit_timer = 0;
    kick_index = 0;
    kick_start = false;
    kick_timer = 0;
    kick_loop = false;
    kick_loop_timer = 0;
    kick_loop_time = 30;
    kick_loop_count = 0;
    kris_move = false;
    kris_move_timer = 0;
    kris_fall = false;
    kris_fall_timer = 0;
    kris_fall_x = 0;
    kris_fall_y = 0;
    con = 0;
    bloom_fx = instance_create(0, 0, obj_fx_screenbloom);
    bloom_fx.style = 2;
    bloom_fx.bloomdist = 0.5;
    bloom_fx.amplitude = 2;
    bloom_fx.period = 10;
    bloom_fx.xoff = 1;
    bloom_fx.yoff = 1;
    bloom_stop = false;
}
trash_hit_snd = 0;
swing_snd = 0;
