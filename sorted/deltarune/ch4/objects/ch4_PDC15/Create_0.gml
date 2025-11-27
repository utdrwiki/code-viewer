con = -1;
customcon = 0;
open_fence = false;
close_fence = false;
rain_start = false;
blackall = -4;
if (global.plot >= 95 && global.plot < 100)
{
    con = 0;
    if (i_ex(obj_noellehouse_fence))
    {
        with (obj_noellehouse_fence)
            close_fence = true;
    }
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.visible = 1;
    if (scr_debug())
    {
        with (obj_border_controller)
        {
            stop_custom_effect();
            show_border(1);
        }
    }
}
else
{
    instance_destroy();
}
