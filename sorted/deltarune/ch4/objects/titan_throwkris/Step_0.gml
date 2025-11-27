if (throwcon == 1)
{
    if (throwready == 0)
        angle += anglespeed;
    if (angle >= 42)
        anglespeed = -2;
    if (angle <= -2)
        anglespeed = 2;
}
if (throwcon == 2)
{
    if (image_index >= 5)
        image_speed = 0;
}
if (angledraw == 1)
{
    lx = lengthdir_x(mypower, angle);
    ly = lengthdir_y(mypower, angle);
    for (i = 0; i < 42; i += 1)
    {
        krisyadd = krisgrav + (krisgrav * i);
        if (i > 0)
            krisyoff[i] = krisyoff[i - 1] + krisyadd;
        else
            krisyoff[0] = krisyadd;
    }
}
