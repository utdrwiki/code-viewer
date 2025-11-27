con = -1;
customcon = 0;
muffled_voice = false;
muffled_timer_max = 50;
muffled_timer = muffled_timer_max;
muffled_alt = 0;
rimshot = false;
rimshot_timer_max = 50;
rimshot_timer = rimshot_timer_max;
kris_toss = false;
kris_toss_timer = 0;
kris_toss_timer_max = 60;
kris_toss_alt = 0;
sideb_mode = scr_sideb_active();
if (global.plot >= 310 && global.plot < 320)
{
    con = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    bed_marker = scr_marker(233, 88, spr_kris_bed);
    bed_marker.depth = 99000;
    pillow_marker = scr_marker(244, 97, spr_kris_bed_pillow);
    pillow_marker.depth = bed_marker.depth - 10;
    pixel = scr_marker(160, 120, spr_pixel_white);
    with (pixel)
    {
        depth = 0;
        image_blend = c_red;
        image_alpha = 0;
        image_xscale = 0.5;
        image_yscale = 0.5;
    }
    if (!sideb_mode)
    {
        phone_marker = scr_marker((camerax() + 204) - 20, (cameray() + 168) - 47, spr_kris_phone_floor);
        phone_marker.depth = blackall.depth + 10;
    }
}
else
{
    instance_destroy();
}
