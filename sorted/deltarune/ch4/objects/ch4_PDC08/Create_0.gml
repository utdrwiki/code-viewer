con = -1;
customcon = 0;
leave_con = 0;
noelle_joined = false;
noelle_joined_track[0] = -4;
noelle_joined_track[1] = -4;
if (global.plot >= 40 && global.plot < 50)
{
    con = 0;
    if (snd_is_playing(global.currentsong[1]))
    {
        mus_volume(global.currentsong[1], 0, 30);
    }
    else
    {
        global.currentsong[0] = snd_init("town_day.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
        mus_volume(global.currentsong[1], 0, 30);
    }
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = -110;
    blackall.image_blend = c_black;
}
if (global.plot >= 90)
    instance_destroy();
