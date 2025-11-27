if (scr_debug())
{
    if (keyboard_check(ord("P")))
        global.flag[1228] = 0;
}
repeat (array_length(global.keyitem))
    scr_keyitemremove(8);
con = -1;
customcon = 0;
make_text = false;
if (global.plot >= 160 && global.plot < 170)
{
    con = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = -110;
    blackall.image_blend = c_black;
    if (global.flag[1228] == 1)
    {
        con = 20;
        safe_delete(blackall);
        global.currentsong[0] = snd_init("wind_highplace.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
        snd_volume(global.currentsong[1], 0, 0);
        snd_volume(global.currentsong[1], 1, 60);
    }
    writer_stay = false;
    scene_end = false;
    scene_end_timer = 0;
    gacha = scr_dark_marker(1920, 224, spr_gachapon_whole_toriel);
    with (gacha)
        scr_depth();
    gacha_cover = scr_dark_marker(gacha.x, gacha.y, spr_gachapon_whole_opaque);
    gacha_cover.depth = gacha.depth - 10;
    technical_difficulties = instance_create(0, 0, obj_dw_technical_difficulties);
    border_white_start = false;
}
else
{
    instance_destroy();
}
noskip = false;
