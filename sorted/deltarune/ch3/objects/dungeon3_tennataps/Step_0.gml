scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (block == 0)
    {
        with (instance_create(x, y, obj_board_solid))
            setxy_board(2400, 1472);
    }
}
else
{
}
