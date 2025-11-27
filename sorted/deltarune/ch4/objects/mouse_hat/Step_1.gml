if (act == 2)
{
    if (y < 260)
    {
        gravity = 0.5;
    }
    else
    {
        scr_depth(id, 0);
        gravity = 0;
        vspeed = 0;
    }
}
