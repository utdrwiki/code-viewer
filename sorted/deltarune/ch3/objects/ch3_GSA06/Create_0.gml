con = -1;
customcon = 0;
if (global.plot >= 110 && global.plot < 120)
{
    scr_setparty(1, 1, 0);
    if (scr_debug() && !i_ex(obj_round_evaluation))
    {
        global.tempflag[90] = 0;
        instance_create(0, 0, obj_round_evaluation);
        exit;
    }
    con = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.image_alpha = 0;
    funometer = instance_create(camerax() + view_wport[0] + 80, 17, obj_dw_tv_funometer);
    funometer.fun = 0;
    funometer.depth = 699990;
    show_credits = false;
    credits = -4;
    credits_kick = false;
    credits_stop = false;
    word_display = false;
    change_rooms = false;
    switch_gameshow_screen = false;
    audience_cheer = instance_find(obj_ch3_audience, 0);
    audience_cheer.depth = blackall.depth + 10;
    audience_sfx_start = false;
    audience_sfx_stop = false;
    audience_sfx_stop_instant = false;
    audience_sfx_lower = false;
    audience_sfx[0] = snd_init("berdly_audience.ogg");
    audience_sfx[1] = -4;
    cheer_loop = -4;
    evaluation_screen = instance_find(obj_round_evaluation, 0);
    gameshow_screen = instance_find(obj_dw_gameshow_screen, 0);
    tenna_kick = false;
    tenna_kick_timer = 0;
    with (obj_caterpillarchara)
        x = 0;
    with (obj_caterpillarchara)
        y = 0;
    with (obj_mainchara)
        x = 0;
    with (obj_mainchara)
        y = 0;
}
else
{
    instance_destroy();
}
