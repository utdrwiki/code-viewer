if (act == 2)
{
    if (y < ystart)
    {
        gravity = 0.5;
    }
    else
    {
        scr_depth(id, 0);
        gravity = 0;
        vspeed = 0;
        act = 0;
    }
}
