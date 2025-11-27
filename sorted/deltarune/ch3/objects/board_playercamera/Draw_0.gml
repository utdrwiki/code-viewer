var xmin = board_tilex(0);
var ymin = board_tiley(0);
var xmax = board_tilex(12 - camwidth);
var ymax = board_tiley(8 - camheight);
if (room == room_dw_b3bs_cheaterpippins)
{
    xmin = 256;
    ymin = 64;
    xmax = 416;
    ymax = 128;
}
if (room == room_dw_puzzlecloset_2)
{
    xmin = 3008;
    ymin = 192;
    xmax = 3488;
    ymax = 448;
}
if (room == room_dw_puzzlecloset_3)
{
    xmin = 2688;
    ymin = 608;
    xmax = xmin + 256;
    ymax = ymin + 160;
}
x = clamp(x, xmin, xmax);
y = clamp(y, ymin, ymax);
var amt = rectprog;
amt = clamp(amt, 0, 1);
draw_sprite_ext(spr_pxwhite, 0, x, y, camwidth * 32, scr_even((camheight / 2) * 32 * amt), 0, c_white, 1);
draw_sprite_ext(spr_pxwhite, 0, x, y + (camheight * 32), camwidth * 32, -scr_even((camheight / 2) * 32 * amt), 0, c_white, 1);
draw_sprite_ext(spr_pxwhite, 0, x + (camwidth * 32), y, -scr_even((camwidth / 2) * 32 * amt), camheight * 32, 0, c_white, 1);
draw_sprite_ext(spr_pxwhite, 0, x, y, scr_even((camwidth / 2) * 32 * amt), camheight * 32, 0, c_white, 1);
if (cameraframe)
{
    for (var i = 0; i < camwidth; i++)
    {
        draw_sprite_ext(spr_board_playercamera, 1, x + (i * 32), y, 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_board_playercamera, 6, x + (i * 32), y + ((camheight - 1) * 32), 2, 2, 0, c_white, 1);
    }
    for (var i = 0; i < camheight; i++)
    {
        draw_sprite_ext(spr_board_playercamera, 3, x, y + (i * 32), 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_board_playercamera, 4, x + ((camwidth - 1) * 32), y + (i * 32), 2, 2, 0, c_white, 1);
    }
    draw_sprite_ext(spr_board_playercamera, 0, x, y, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_board_playercamera, 2, x + (32 * (camwidth - 1)), y, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_board_playercamera, 5, x, y + (32 * (camheight - 1)), 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_board_playercamera, 7, x + (32 * (camwidth - 1)), y + (32 * (camheight - 1)), 2, 2, 0, c_white, 1);
}
if (con == 0)
{
    arrowtimer++;
    if ((arrowtimer % 15) == 0)
        arrowdraw = 1 - arrowdraw;
    if (arrowdraw)
    {
        draw_sprite_ext(spr_board_playercamera_arrow, 0, x - 4, scr_even((y + ((camheight / 2) * 32)) - 8), 2, 2, -90, c_white, 1);
        draw_sprite_ext(spr_board_playercamera_arrow, 0, x + (camwidth * 32) + 4, scr_even(y + ((camheight / 2) * 32) + 8), 2, 2, 90, c_white, 1);
        draw_sprite_ext(spr_board_playercamera_arrow, 0, scr_even(x + 8 + ((camwidth / 2) * 32)), scr_even(y) - 4, 2, 2, 180, c_white, 1);
        draw_sprite_ext(spr_board_playercamera_arrow, 0, scr_even((x - 8) + ((camwidth / 2) * 32)), scr_even(y + (camheight * 32) + 4), 2, 2, 0, c_white, 1);
    }
}
