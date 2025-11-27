if (view_current == 0)
{
    timer = 0;
    battledepth = 10;
    bgdepth = 1000301;
    xpos = 0;
    depth = bgdepth;
    battlealpha = 0;
    batcon = 0;
    if (global.chapter == 3)
    {
        if (room == room_dw_ranking_hub || room == room_dw_green_room)
            bgdepth = 400000;
    }
}
