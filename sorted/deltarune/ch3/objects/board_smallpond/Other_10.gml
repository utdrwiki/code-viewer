if (room != room_board_1_sword)
{
    if (buffer < 0 && init)
    {
        myinteract = 3;
        global.interact = 1;
        if (kr != 0)
        {
            kr_mem = kr.canfreemove;
            kr.canfreemove = 0;
        }
        if (su != 0)
        {
            su_mem = su.canfreemove;
            su.canfreemove = 0;
        }
        if (ra != 0)
        {
            ra_mem = ra.canfreemove;
            ra.canfreemove = 0;
        }
    }
}
