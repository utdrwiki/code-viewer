var randomizedir = 0;
if (x > rx)
{
    x = rx - 1;
    hspeed = -abs(hspeed);
    randomizedir = 1;
}
if (x < lx)
{
    x = lx + 1;
    hspeed = abs(hspeed);
    randomizedir = 1;
}
if (y > dx)
{
    vspeed = -abs(vspeed);
    y = dx - 1;
    randomizedir = 1;
}
if (y < ux)
{
    y = ux + 1;
    vspeed = abs(vspeed);
    randomizedir = 1;
}
if (randomizedir)
    direction += random_range(-5, 5);
