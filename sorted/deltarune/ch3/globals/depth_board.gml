function scr_depth_board()
{
    depth = 1000000 - ((y * 10) + ((sprite_height - sprite_yoffset) * 10));
}

function scr_board_depth()
{
    scr_depth_board();
}
