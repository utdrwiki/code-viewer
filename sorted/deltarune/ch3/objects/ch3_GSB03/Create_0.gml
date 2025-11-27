con = -1;
customcon = 0;
saveload = false;
if (global.plot >= 140 && global.plot < 150)
{
    scr_setparty(1, 1, 0);
    if (scr_debug() && !i_ex(obj_round_evaluation))
    {
        instance_create(0, 0, obj_round_evaluation);
        exit;
    }
    con = 0;
    show_credits = false;
    credits = -4;
    credits_stop = false;
    word_display = false;
    change_rooms = false;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.image_alpha = 0;
    funometer = instance_create(camerax() + view_wport[0] + 80, 17, obj_dw_tv_funometer);
    funometer.fun = 0;
    funometer.depth = 699990;
    audience_cheer = instance_find(obj_ch3_audience, 0);
    gameshow_screen = instance_find(obj_dw_gameshow_screen, 0);
    border_switch = false;
}
else
{
    instance_destroy();
}
