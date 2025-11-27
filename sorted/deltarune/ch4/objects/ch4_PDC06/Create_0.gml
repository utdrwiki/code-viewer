con = -1;
customcon = 0;
if (global.flag[1661] == 0)
    scr_setparty(1, 1, 0);
if (global.plot >= 35 && global.plot < 110 && scr_flag_get(706) == 0)
{
    con = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    nuzzle_marker = scr_dark_marker(732, 1146, spr_ralsei_nuzzle_head);
    nuzzle_marker.depth = 5000;
    nuzzle_marker.visible = 0;
    with (obj_mainchara)
        cutscene = 1;
    camera_setxy(440, 1040);
}
else
{
    instance_destroy();
}
