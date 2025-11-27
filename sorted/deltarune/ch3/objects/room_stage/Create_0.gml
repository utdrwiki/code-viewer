con = -1;
customcon = 0;
saveload = false;
_blackall = scr_dark_marker(-10, -10, spr_pixel_white);
_blackall.image_xscale = 999;
_blackall.image_yscale = 999;
_blackall.depth = 100;
_blackall.image_blend = c_black;
_blackall.visible = 0;
if (global.plot >= 120 && global.plot < 125)
{
    if (global.plot < 122 && scr_flag_get(1199) == 0)
    {
        con = 0;
        _blackall.visible = 1;
    }
}
else if (global.plot >= 160)
{
    if (scr_flag_get(1208) == 0)
    {
        con = 10;
        _blackall.visible = 1;
    }
    else if (scr_flag_get(1056) == 0)
    {
        con = 20;
        _blackall.visible = 1;
        scr_losechar();
    }
    else
    {
        con = -1;
        instance_destroy();
    }
}
var makeset = true;
if (makeset)
{
    scr_marker_ext(0, 452, spr_gameshow_couch, 2, 2, undefined, undefined, undefined, 1000);
    scr_marker_ext(128, 438, spr_gameshow_playerpodiums, 2, 2, undefined, undefined, undefined, 1000);
}
