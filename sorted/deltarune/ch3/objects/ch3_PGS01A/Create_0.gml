con = -1;
customcon = 0;
left_couch = false;
run_check = false;
run_timer = 0;
run_con = -1;
couch = instance_create(240, 64, obj_ch3_couch);
with (couch)
    scr_depth();
susie_snore = true;
susie_snore_stop = false;
susie_snore_sfx = -4;
with (obj_border_controller)
    hide_border();
blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = -110;
blackall.image_blend = c_black;
blackall.image_alpha = 0;
if (global.plot < 10)
{
    con = 0;
    blackall.image_alpha = 1;
    scr_losechar();
    with (obj_border_controller)
        hide_border();
    snd_free_all();
}
else
{
    susie_snore = false;
    if (scr_flag_get(1021) == 0)
    {
        con = 99;
        left_couch = true;
        if (global.tempflag[40] == 1)
        {
            with (couch)
                show_sparkle();
        }
    }
    else
    {
        with (couch)
        {
            walkaway = true;
            hide_sparkle();
        }
    }
    if (!snd_is_playing(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init("wind_highplace.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.5, 1);
    }
    with (instance_create(210, 420, obj_circlezoom))
        type = 3;
}
