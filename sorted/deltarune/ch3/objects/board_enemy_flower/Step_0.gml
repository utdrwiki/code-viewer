if (con == 0)
    depth = 999990;
if (con == 1)
{
    if (i_ex(obj_mainchara_board))
        depth = obj_mainchara_board.depth - 80;
    timer = 0;
    con = 2;
}
if (con == 2)
{
    timer++;
    if (timer == shottarget)
    {
        instance_create(x + 16, y + 14, obj_board_enemy_flower_bullet);
        timer = -shottarget / 2;
    }
}
if (con == 3)
{
    timer = 0;
    con = 0;
}
