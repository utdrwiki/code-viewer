con = -1;
customcon = 0;
blackall = -4;
whiteall = -4;
border_change = false;
border_val = 0;
if (global.plot >= 243)
{
    if (global.flag[1658] == 1 && global.tempflag[58] == 1)
    {
        global.interact = 1;
        global.tempflag[58] = 0;
        con = 0;
        blackall = scr_dark_marker(-10, -10, spr_pixel_white);
        blackall.image_xscale = 999;
        blackall.image_yscale = 999;
        blackall.depth = 0;
        blackall.image_blend = c_black;
        whiteall = scr_dark_marker(-10, -10, spr_pixel_white);
        whiteall.image_xscale = 999;
        whiteall.image_yscale = 999;
        whiteall.depth = -10;
    }
}
else if (!scr_havechar(3))
{
    scr_getchar(3);
}
