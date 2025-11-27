if (scr_debug())
{
    recordsave = true;
    if (con == 0)
    {
        con = 1;
        recordcount = 0;
    }
    else
    {
        con = 2;
        recordcount = 0;
    }
}
