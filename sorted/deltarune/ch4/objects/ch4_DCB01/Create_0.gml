con = -1;
customcon = 0;
if (global.plot >= 225 && global.plot < 230)
{
    con = 0;
    scr_setparty(1, 0, 0);
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
}
else
{
    instance_destroy();
}
