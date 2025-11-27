con = 0;
timer = 0;
init = 0;
susie = 0;
ralsei = 0;
kris = 0;
tenna = 0;
plugin = 0;
screenfade = 0;
elpipsis = 0;
with (obj_ch3_gameshow.wires)
    image_alpha = 0;
with (obj_board_controller)
    drawcrt = false;
blackover = scr_board_marker(board_tilex(0), board_tiley(0), spr_pxwhite, 0);
with (blackover)
{
    image_blend = c_black;
    image_xscale = 384;
    image_yscale = 256;
}
