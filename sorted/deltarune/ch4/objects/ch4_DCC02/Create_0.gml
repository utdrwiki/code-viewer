con = -1;
customcon = 0;
scr_setparty(1, 1, 0);
if (global.plot >= 250 && global.plot < 260)
{
    con = 0;
    if (global.tempflag[96] == 1)
        global.tempflag[96] = 0;
    if (scr_debug())
    {
    }
    whiteall = scr_dark_marker(-10, -10, spr_pixel_white);
    whiteall.image_xscale = 999;
    whiteall.image_yscale = 999;
    whiteall.depth = 100;
    susie_hide = false;
    susie_shadow = 0;
    ralsei_hide = false;
    ralsei_shadow = 0;
}
else
{
    instance_destroy();
}
