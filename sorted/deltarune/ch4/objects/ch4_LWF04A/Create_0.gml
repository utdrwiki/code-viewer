con = -1;
customcon = 0;
if (global.plot >= 310 && global.plot < 320)
{
    con = 0;
    vfx = instance_create(0, 0, obj_ch4_LWF04A_vfx);
    vfx.depth = 988;
    if (i_ex(obj_lw_rain_effect))
    {
        toggle_effect();
        with (obj_lw_rain_effect)
            instance_destroy();
    }
    snd_free_all();
    phone_vfx = instance_create(0, 0, obj_ch4_LWF04A_phone);
    phone_vfx.visible = false;
    blackall = scr_dark_marker(-120, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.image_alpha = 0;
    window_marker = scr_marker(71, 194, spr_torhouse_window_kris_dark);
    window_marker.depth = 940000;
    window_marker_light = scr_marker(71, 194, spr_torhouse_window_kris);
    window_marker_light.depth = blackall.depth - 10;
    window_marker_light.image_alpha = 0;
    window_marker_red = scr_marker(71, 194, spr_torhouse_window_kris_eyeglow);
    window_marker_red.depth = window_marker_light.depth - 10;
    window_marker_red.image_alpha = 0;
    flash_marker = scr_marker(83, 209, spr_kris_eyeflash);
    flash_marker.depth = window_marker_red.depth - 10;
    flash_marker.image_blend = c_red;
    flash_marker.visible = 0;
    fade_pitch = false;
    rain_pitch = 1;
    with (obj_mainchara)
    {
        visible = 0;
        y = -40;
    }
}
else
{
    instance_destroy();
}
