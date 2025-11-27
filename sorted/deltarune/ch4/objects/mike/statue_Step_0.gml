if (act == 1)
{
    x = xstart + irandom_range(-1, 1);
    y = ystart + irandom_range(-1, 1);
    timer += 1;
    if (timer > 10)
    {
        act = 0;
        timer = 0;
        x = xstart;
        y = ystart;
    }
}
