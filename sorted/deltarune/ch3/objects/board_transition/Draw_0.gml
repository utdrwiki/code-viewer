var screenx = 128;
var screeny = 64;
if (room == room_dw_puzzlecloset_3)
{
    screenx = 2688;
    screeny = 608;
}
for (var i = 0; i < width; i++)
{
    for (var j = 0; j < height; j++)
    {
        if (tile[i][j] == 1)
            draw_sprite_ext(spr_board_blacktile, 0, screenx + (i * 16), screeny + (j * 16), 1, 1, 0, c_white, 1);
    }
}
