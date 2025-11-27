scr_depth();
if (!init)
{
    biggerLight = radius + 10;
    smallerLight = radius;
    init = true;
}
if ((!i_ex(owner) && active) || active == 2)
{
    active = false;
    smallerLight += 10;
    biggerLight += 10;
    siner = -4;
}
if (!active)
{
    smallerLight = scr_movetowards(smallerLight, 0, siner);
    biggerLight = scr_movetowards(biggerLight, 0, siner);
    if (smallerLight == 0 && biggerLight == 0)
        instance_destroy();
    siner += 2;
}
