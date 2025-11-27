con = -1;
customcon = 0;
if (global.plot < 5)
{
    colcol = 0;
    image_speed = 0;
    image_xscale = 2;
    image_yscale = 2;
    siner = 0;
    made = 0;
    adjust = 0;
    global.interact = 1;
    y += 260;
    susx = x - 80;
    susy = y + 20;
    sussprite = spr_susieu_bright;
    susindex = 0;
    songplay = 0;
    with (obj_mainchara)
        visible = 0;
    fade_con = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.visible = 1;
    if (audio_is_playing(global.currentsong[1]))
        snd_free(global.currentsong[0]);
    global.currentsong[0] = snd_init("wind_highplace.ogg");
    global.currentsong[1] = mus_loop(global.currentsong[0]);
    mus_volume(global.currentsong[1], 0, 0);
    mus_volume(global.currentsong[1], 0.8, 60);
    scr_delay_var("con", 0, 60);
    scr_losechar();
    if (i_ex(obj_caterpillarchara))
        instance_destroy(obj_caterpillarchara);
    with (obj_border_controller)
        hide_border();
}
else
{
    instance_destroy();
}
