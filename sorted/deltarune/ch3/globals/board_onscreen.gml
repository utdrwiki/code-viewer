function scr_board_onscreen()
{
    if (x >= 128 && x < 512 && y >= 64 && y <= 320)
        return 1;
    else
        return 0;
}
