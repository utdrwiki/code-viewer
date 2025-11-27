if (active)
{
    if (locktorouxls)
    {
        if (i_ex(rouxls_board) && i_ex(favoredfriend) && i_ex(angryfriendo))
        {
            var angrymod = 0;
            if (angryfriendo.image_xscale == -2)
                angrymod = 32;
            angryfriendo.x = (rouxls_board.x - 26) + angrymod;
            angryfriendo.y = rouxls_board.y - 30;
            favoredfriend.x = rouxls_board.x + 26;
            favoredfriend.y = rouxls_board.y - 30;
            favoredfriend.depth = rouxls_board.depth - 1;
            angryfriendo.depth = rouxls_board.depth - 1;
        }
    }
}
