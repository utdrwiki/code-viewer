con = -1;
customcon = 0;
if (global.plot <= 15)
{
    couch_marker = scr_marker(427, 182, bg_torhouse_couch);
    couch_marker.depth = 10000;
    if (global.plot < 15)
    {
        bottom_marker = scr_marker(0, 200, spr_whitepx_10);
        bottom_marker.image_xscale = 60;
        bottom_marker.image_blend = c_black;
        bottom_marker.depth = 60000;
    }
}
if (global.plot >= 5 && global.plot < 10)
{
    con = 0;
    scr_losechar();
    global.darkzone = 0;
    snd_free_all();
    blanket_fly = false;
    blanket_fly_timer = 0;
    slow_writer = false;
    susie_sfx = false;
    with (obj_mainchara)
    {
        visible = 0;
        x = 550;
    }
    can_sleep = global.tempflag[41] == 1 && !scr_sideb_active();
    skip_intro = false;
    skip_intro_con = 0;
    sparkle_marker = -4;
    sparkle_readable = -4;
    blackall = -4;
}
else
{
    instance_destroy();
}
