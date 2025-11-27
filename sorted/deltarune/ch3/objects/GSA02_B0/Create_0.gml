global.interact = 1;
con = 0;
timer = 0;
consolestarter = 0;
blackout = scr_board_marker(board_tilex(0), board_tiley(0), spr_pxwhite);
with (blackout)
{
    image_blend = c_black;
    image_xscale = 384;
    image_yscale = 256;
    depth = 998390;
}
sword = 0;
depth = -2;
chold = 0;
drawscreen = 0;
animindex = 0;
buffer = 6;
snd_stop_all();
nopress = 0;
flash = 0;
border[0] = scr_marker(0, 0, spr_pxwhite);
with (border[0])
{
    image_blend = c_black;
    image_xscale = 640;
    image_yscale = 64;
}
border[1] = scr_marker(0, 64, spr_pxwhite);
with (border[1])
{
    image_blend = c_black;
    image_xscale = 128;
    image_yscale = 480;
}
border[2] = scr_marker(512, 64, spr_pxwhite);
with (border[2])
{
    image_blend = c_black;
    image_xscale = 128;
    image_yscale = 480;
}
border[3] = scr_marker(128, 320, spr_pxwhite);
with (border[3])
{
    image_blend = c_black;
    image_xscale = 384;
    image_yscale = 160;
}
with (obj_border_controller)
    show_border();
