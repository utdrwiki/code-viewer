scr_gameshow_populatevars();
scr_board_populatevars();
if (kris.boat == true)
{
    depth = 100000;
    if (depth < obj_board_b2_atlantisdecor.depth)
        depth = obj_board_b2_atlantisdecor.depth + 1;
}
else
{
    depth = 999999;
}
