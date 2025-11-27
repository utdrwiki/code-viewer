con = -1;
customcon = 0;
blackall = scr_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = -110;
blackall.image_blend = c_black;
leave_ready = false;
var smoke = instance_create(0, 0, obj_dw_blacksmoke);
border_show = false;
if (global.plot < 350)
{
    con = 0;
    scr_setparty(1, 0, 0);
    kris_marker = scr_marker(-200, -200, spr_kris_dw_landed);
    kris_marker.image_alpha = 0;
    susie_marker = scr_marker(-200, -200, spr_susie_dw_landed);
    susie_marker.image_alpha = 0;
    deep_audio_start = false;
    deep_audio_stop = false;
    global.darkzone = 0;
    with (obj_border_controller)
        hide_border();
}
else
{
    instance_destroy();
}
