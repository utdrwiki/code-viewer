con = -1;
customcon = 0;
startfallingcon = 0;
bullet_area = instance_find(obj_overworld_bulletarea, 0);
with (bullet_area)
    keepHidden = 1;
kris_windy = instance_create(200, 4100, obj_dw_windy_kris);
with (kris_windy)
    init("kris");
kris_windy.visible = false;
wind_effect = instance_create(0, 0, obj_church_wind_effect);
wind_effect.con = 0;
start_falling = false;
slide_dust = 0;
slidetimer = 0;
arch = instance_create(0, 0, obj_marker);
arch.sprite_index = spr_foreground_arch;
arch.visible = false;
arch.image_speed = 0;
arch.image_index = 1;
arch.depth = -100;
arch.image_xscale = 2;
arch.image_yscale = 2;
foreground_con = 0;
foreground_y = 480;
if (global.plot >= 105 && global.plot < 110)
{
    con = 0;
    palette_shift = false;
    palette_index = 0;
    palette_siner = 0;
    if (snd_is_playing(global.currentsong[1]))
        mus_volume(global.currentsong[1], 0, 30);
    scr_setparty(1, 0, 0);
    pal_swap_layer_init();
    pal_swap_enable_layer("TILES");
    pal_swap_enable_layer("ASSETS_Staircase");
    pal_swap_set_layer(3666, palette_index, "TILES", false);
    pal_swap_set_layer(3666, palette_index, "ASSETS_Staircase", false);
    pal_swap_reset();
    roaring_knight = instance_create(200, 100, obj_ch4_DCA01_roaringknight);
    roaring_knight.sprite_index = spr_roaringknight_lift_head;
    roaring_knight.image_index = 0;
    roaring_knight.depth = 899990;
    chase_start = false;
    chase_timer = 0;
    wind_shake_push = false;
    wind_shake_timer = 0;
    wind_shake_screen = -4;
    shake_start = false;
    shake_duration = 150;
    wind_push = false;
    wind_push_timer = 0;
    wind_sfx[0] = -4;
    wind_sfx[1] = -4;
    wind_sfx_state = 0;
    wind_sfx_pitch = 0;
    wind_sfx_pitch_target = 1.5;
    wind_sfx_volume = 0;
    wind_sfx_volume_target = 0.7;
    wind_state = 0;
    wind_sound = -4;
    sword_susie = false;
    sword_susie_timer = 0;
    slide_noise = false;
    slide_noise_duration = 10;
    susie_marker = scr_dark_marker(-100, -100, spr_susie_walk_right_dw_unhappy);
    with (susie_marker)
        scr_depth();
    susie_readable = -4;
    susie_collider = -4;
    sword_fall = false;
    sword_fall_timer = 0;
    slow_writer = false;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 9999;
    blackall.depth = 6000;
    blackall.image_blend = c_black;
    blackall.image_alpha = 0;
    reached_end = false;
    overworld_bullets = false;
    overworld_bullets_timer = 0;
    screen_distort = false;
    camera_pan = false;
    camera_pan_timer = 0;
    camera_y_pos = 3840;
    camera_y_target = 0;
    broken_stairs_marker = instance_create(142, 3964, obj_dw_church_stairs_broken);
    broken_stairs_marker.depth = 999990;
    broken_stairs_marker.visible = 0;
    kris_battle_mode = false;
}
else
{
    if (global.plot >= 110)
    {
        broken_stairs_marker = instance_create(142, 3964, obj_dw_church_stairs_broken);
        broken_stairs_marker.depth = 999990;
        with (obj_dw_church_stairs)
            image_index = 1;
        with (broken_stairs_marker)
            break_stairs();
    }
    instance_destroy();
}
