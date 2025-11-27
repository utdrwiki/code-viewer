con = -1;
customcon = 0;
snd_free_all();
if (scr_flag_get(1219) == 0)
{
    con = 0;
    saveload = false;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 5100;
    blackall.image_blend = c_black;
    whiteall = scr_dark_marker(-10, -10, spr_pixel_white);
    whiteall.image_xscale = 999;
    whiteall.image_yscale = 999;
    whiteall.depth = -1100;
    whiteall.image_alpha = 0;
    kr_cover = scr_dark_marker(-10, -10, spr_pixel_white);
    kr_cover.image_xscale = 999;
    kr_cover.image_yscale = 999;
    kr_cover.depth = 5100;
    kr_cover.image_blend = c_black;
    kr_cover.visible = 0;
    susiezilla_controller = instance_create(camerax(), cameray(), obj_susiezilla_gamecontroller);
    with (susiezilla_controller)
        setup(0);
    tv_backstage = scr_dark_marker(susiezilla_controller.xorig - susiezilla_controller.bgxoffset, 0, spr_susiezilla_background_backstage);
    tv_backstage.image_xscale = 2;
    tv_backstage.image_yscale = 2;
    tv_backstage.depth = 105100;
    start_game = false;
    susie_stinger = false;
    tv_time = instance_create(1340, 230, obj_tenna_tv_time);
    start_flames = false;
    stop_flames = false;
    flames = -4;
    visited_tenna = scr_flag_get(1208) > 0;
}
else
{
    mus_play_ext("minigame_kart.ogg", true);
    global.interact = 0;
    with (obj_mainchara)
        visible = 0;
    with (obj_caterpillarchara)
        visible = 0;
    susiezilla_controller = instance_create(camerax(), cameray(), obj_susiezilla_gamecontroller);
    with (susiezilla_controller)
    {
        setup(0);
        loss_counter = scr_flag_get(1080);
        susie.visible = 1;
        statue.visible = 1;
        krisandsusie.visible = 1;
        start();
    }
    var retry_screen = instance_create(0, 0, obj_gameover_retry);
    instance_destroy();
}
