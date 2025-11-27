con = -1;
customcon = 0;
guitar_con = 0;
sparkle_marker = -4;
if (global.plot >= 60 && global.plot < 62)
{
    sparkle_marker = scr_marker(207, 113, spr_shine);
    sparkle_marker.depth = 98700;
    sparkle_marker.image_speed = 0.1;
}
if (global.plot == 60)
{
    if (!snd_is_playing(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init("noelle_distant.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.8, 1);
    }
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.image_alpha = 0;
    border_hide = false;
    if (scr_debug())
    {
        with (obj_border_controller)
            show_border(1);
    }
    scr_losechar();
    if (i_ex(obj_caterpillarchara))
    {
        with (obj_caterpillarchara)
            instance_destroy();
    }
}
else
{
    instance_destroy();
}
