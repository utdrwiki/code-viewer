var xoff = 320;
makeshads = true;
if (scr_enemylostcheck("shad"))
    makeshads = false;
if (global.flag[1147] == 0 || global.flag[1147] == 20)
    makeshads = false;
bg_vfx = instance_create(xoff, -20, obj_dw_teevie_rhythm_bg);
with (bg_vfx)
    depth = 10000000;
if (makeshads)
{
    var _shadowguy_left_a = scr_dark_marker(60 + xoff, 140, spr_shadowman_sax_a);
    with (_shadowguy_left_a)
    {
        scr_flip("x");
        scr_depth();
        image_speed = 0.2;
    }
    var _shadowguy_right_a = scr_dark_marker(470 + xoff, 140, spr_shadowman_sax_a);
    with (_shadowguy_right_a)
    {
        scr_depth();
        image_speed = 0.2;
    }
    var _shadowguy_middle = scr_dark_marker(260 + xoff, 165, spr_shadowman_spare);
    with (_shadowguy_middle)
    {
        scr_depth();
        image_speed = 0.1;
    }
    var _shadowguy_left_b = scr_dark_marker(140 + xoff, 165, spr_shadowman_sax_bunny);
    with (_shadowguy_left_b)
    {
        scr_flip("x");
        scr_depth();
        image_speed = 0.2;
    }
    var _shadowguy_right_b = scr_dark_marker(380 + xoff, 165, spr_shadowman_sax_bunny);
    with (_shadowguy_right_b)
    {
        scr_depth();
        image_speed = 0.2;
    }
}
siner = 0;
anim_index = 0;
base_y_pos = cameray() + view_hport[0] + 200;
base_x_scale = 2;
base_y_scale = 2;
audience_active = false;
audience_show = false;
audience_hide = false;
audience_hide_slow = false;
audience_pause = false;
audience_bounce = false;
audience_bounce_stop = true;
move_timer = 0;
x_offset = 0;
rose_throw = false;
rose_throw_time = 20;
rose_throw_timer = rose_throw_time;
rose_throw_full_width = false;
debug_timer = 0;
depth = 96000;
blend_mode = 16777215;
siner_speed = 0.15;
follow = true;
threshold_left = 0;
threshold_right = room_width;
drawcrowd = true;
if (scr_ch3_violencecheck() >= 5)
    drawcrowd = false;
emitter = audio_emitter_create();
if (drawcrowd)
{
    cheer_audio[0] = snd_init("berdly_audience.ogg");
    cheer_audio[1] = audio_play_sound_on(emitter, cheer_audio[0], true, 0);
}
