con = -1;
customcon = 0;
if (global.plot >= 120 && global.plot < 130)
{
    con = 0;
    tenna_marker = scr_dark_marker(493, cameray() + 274, spr_tenna_hooray_armsup);
    tenna_marker.depth = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    tv_time = instance_create(0, 0, obj_tenna_tv_time);
    audience_cheer = instance_find(obj_ch3_audience, 0);
    audience_show = false;
    audience_hide = false;
    audience_con = 0;
    laugh_track = false;
    laugh_track_timer = 0;
    laugh_con = 0;
    screen_wipe_start = false;
    cheer_loop = -4;
    if (scr_flag_get(1076) == 1)
    {
        scr_flag_set(1076, 2);
        with (obj_mainchara)
            usprite = spr_krisu_dark;
    }
    if (scr_flag_get(1077) == 1)
    {
        scr_flag_set(1077, 2);
        with (obj_mainchara)
            usprite = spr_krisu_dark;
    }
    gameshow_screen = instance_find(obj_dw_gameshow_screen, 0);
    border_switch = false;
    with (obj_border_controller)
    {
        set_border(border_dw_tv_black, 1);
        show_border(0.03);
    }
}
else
{
    instance_destroy();
}
