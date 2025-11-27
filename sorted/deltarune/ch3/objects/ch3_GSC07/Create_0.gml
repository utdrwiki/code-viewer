con = -1;
customcon = 0;
if (global.plot >= 170 && global.plot < 180)
{
    scr_setparty(1, 1, 0);
    con = 0;
    bg_vfx = instance_create(0, 0, obj_ch3_GSC07_bg);
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    capture_gacha_kris = false;
    capture_gacha_susie = false;
    capture_gacha_ralsei = false;
    capture_gacha_end = false;
    susie_punch = false;
    susie_punch_timer = 0;
    distort_music = false;
    distort_audio = -4;
    gameshow_screen = instance_find(obj_dw_gameshow_screen, 0);
    gameshow_screen.visible = 0;
    for (var i = 0; i < instance_number(obj_quiz_podium); i++)
        podium[i] = instance_find(obj_quiz_podium, i);
    hall_show = false;
    hall_hide = false;
    hall_timer = 0;
    hall_left = scr_dark_marker(sprite_get_width(spr_gameshow_halloffame_left) * 2, cameray() - (sprite_get_height(spr_gameshow_halloffame_left) * 2), spr_gameshow_halloffame_left);
    hall_right = scr_dark_marker(sprite_get_width(spr_gameshow_halloffame_left) * 2, cameray() - (sprite_get_height(spr_gameshow_halloffame_left) * 2), spr_gameshow_halloffame_right);
    with (hall_left)
        depth = 790000;
    with (hall_right)
        depth = 790000;
    audience_cheer = instance_find(obj_ch3_audience, 0);
    tv_time = instance_create(camerax() + (view_wport[0] / 2), 230, obj_tenna_tv_time);
    spotlight = instance_create(0, 0, obj_ch3_GSC07_spotlight);
    spotlight.visible = 0;
    global.flag[20] = 0;
    laugh_track = false;
    laugh_track_timer = 0;
    laugh_track_finish = true;
    cleanup = false;
    slow_writer = false;
    show_fire = false;
    with (obj_border_controller)
        hide_border();
    border_show = false;
    border_switch = false;
    if (scr_flag_get(1077) == 1)
    {
        scr_flag_set(1077, 2);
        with (obj_mainchara)
            usprite = spr_krisu_dark;
    }
}
else
{
    instance_destroy();
}
