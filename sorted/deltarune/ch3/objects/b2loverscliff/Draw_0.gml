if (active && scr_debug())
{
    if (obj_board_camera.con == 0)
    {
        scr_board_objname();
        var count = 0;
        showval(board_tilex(0) + 10, board_tiley(0) + 10 + (12 * count), "con");
        count++;
        showval(board_tilex(0) + 10, board_tiley(0) + 10 + (12 * count), "timer");
        count++;
    }
}
