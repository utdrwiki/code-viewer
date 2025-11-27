con = -1;
customcon = 0;
choosetimer = 0;
choose_sundae = false;
choose_timeup = false;
qc_hide = false;
qc_show = false;
qc_shadow = 0;
door_timer = 0;
door_time = false;
diner_bgm = false;
diner_bgm_stop = false;
if (global.plot >= 50 || scr_flag_get(701) > 0)
{
    instance_destroy();
}
else
{
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.image_alpha = 0;
}
