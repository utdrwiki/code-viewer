con = -1;
customcon = 0;
var _door_marker = scr_dark_marker(236, 40, spr_dw_interstitial_doors);
with (_door_marker)
    depth = 999990;
if (scr_flag_get(1057) == 1 && scr_flag_get(1085) == 0)
{
    with (obj_caterpillarchara)
    {
        follow = 0;
        fun = 1;
        visible = 0;
    }
}
if (global.plot >= 180 && global.plot < 205)
{
    con = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.visible = 1;
    door_cover = scr_dark_marker(240, 131, spr_pixel_white);
    door_cover.image_blend = c_black;
    door_cover.image_xscale = 40;
    door_cover.image_yscale = 27;
    door_cover.depth = _door_marker.depth - 10;
    door_cover.visible = 0;
    adjust_caterpillar = false;
    kris_hide = false;
    kris_shadow = 0;
    ralsei_hide = false;
    ralsei_shadow = 0;
    susie_hide = false;
    susie_shadow = 0;
}
else
{
    instance_destroy();
}
fademusic = 0;
