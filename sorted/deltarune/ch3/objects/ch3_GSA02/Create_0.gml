con = -1;
customcon = 0;
podium[0] = instance_create(100, 280, obj_quiz_podium);
podium[1] = instance_create(184, 280, obj_quiz_podium);
podium[2] = instance_create(268, 280, obj_quiz_podium);
podium[0].name = "kris";
podium[1].name = "susie";
podium[2].name = "ralsei";
podium[0].image_index = 1;
podium[1].image_index = 1;
podium[2].image_index = 1;
with (obj_quiz_podium)
    scr_depth();
if (global.plot < 80)
{
    scr_setparty(1, 1, 0);
    con = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    spotlight = instance_create(0, 0, obj_ch3_GSA02_spotlight);
    spotlight.depth = blackall.depth - 10;
    spotlight.visible = 0;
    name_select = false;
    name_select_timer = 0;
    screen_wipe_start = false;
    audience_cheer = instance_find(obj_ch3_audience, 0);
    audience_sfx_start = false;
    audience_sfx_stop = false;
    audience_sfx_stop_instant = false;
    audience_sfx[0] = snd_init("berdly_audience.ogg");
    audience_sfx[1] = -4;
    gameshow_screen = instance_find(obj_dw_gameshow_screen, 0);
    laugh_track = false;
    laugh_track_timer = 0;
    global.flag[20] = 0;
    tv_time = instance_create(0, 0, obj_tenna_tv_time);
    technical_difficulties = instance_create(0, 0, obj_dw_technical_difficulties);
    with (obj_border_controller)
        hide_border();
    border_show = false;
    border_white_start = false;
    border_white_stop = false;
}
else
{
    instance_destroy();
}
setname = 0;
aaa = 0;
aaatimer = 0;
