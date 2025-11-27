if (tiledone == 0 && tilecon == 0)
{
    if (type == 1)
        tilecon = 1;
    if (type == 0)
    {
        if (obj_mainchara_board.movetype == "board" && obj_mainchara_board.movesleft == 0 && obj_mainchara_board.movingnow == 0)
            tilecon = 1;
    }
}
