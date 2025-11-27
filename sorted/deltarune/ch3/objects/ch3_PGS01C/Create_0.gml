con = -1;
customcon = 0;
if (global.plot < 30)
{
    con = 0;
    if (!snd_is_playing(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init("wind_highplace.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
    }
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = -110;
    blackall.image_blend = c_black;
    blackall.image_alpha = 0;
}
else
{
    instance_destroy();
}
noskip = false;
