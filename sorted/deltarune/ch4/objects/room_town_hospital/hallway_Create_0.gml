con = -1;
convo_type = 0;
blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = 100;
blackall.image_blend = c_black;
blackall.image_alpha = 0;
if (scr_flag_get(349) > 0)
{
    if (scr_flag_get(759) == 0)
    {
        convo_type = 2;
    }
    else if (scr_flag_get(759) == 1)
    {
        convo_type = 3;
        con = 0;
        blackall.image_alpha = 1;
    }
}
else if (scr_flag_get(755) > 0 && scr_flag_get(758) == 0)
{
    convo_type = 1;
    con = 0;
    blackall.image_alpha = 1;
}
