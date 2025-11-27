con = -1;
customcon = 0;
if (global.plot >= 290 && global.plot < 300)
{
    con = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.visible = 1;
    door_marker = scr_marker(283, 264, spr_church_door);
    with (door_marker)
        depth = 89000;
    kris_show = false;
    kris_shadow = 0.8;
    kris_marker = scr_marker(288, 306, spr_krisd);
    with (kris_marker)
        scr_depth();
    kris_marker.visible = 0;
}
else
{
    instance_destroy();
}
