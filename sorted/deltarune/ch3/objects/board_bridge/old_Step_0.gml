if (i_ex(obj_mainchara_board))
{
    if (obj_mainchara_board.dir == "left" || obj_mainchara_board.dir == "right")
        depth = obj_mainchara_board.depth + 10;
    else
        depth = obj_mainchara_board.depth - 10;
    if (obj_mainchara_board.movingnow == 0)
        depth = 900000;
}
else
{
    depth = 900000;
}
