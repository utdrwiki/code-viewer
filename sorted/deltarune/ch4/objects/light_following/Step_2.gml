if (i_ex(target))
{
    if (followtype == 1)
        setxy(target.x + xoff, target.y + yoff);
    if (followtype == 2)
    {
        x = lerp(x, target.x + xoff, lerpstrength);
        y = lerp(y, target.y + yoff, lerpstrength);
    }
}
