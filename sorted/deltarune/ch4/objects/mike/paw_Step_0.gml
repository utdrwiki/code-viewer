if (action == 0)
{
    y = scr_approach(y, newy, 1);
    y += ((newy - y) * 0.2);
    if (y == newy)
        action = 1;
}
if (action == 1)
{
    wait += 1;
    if (wait > wait_time)
        action = 2;
}
if (action == 2)
{
    y = scr_approach(y, ystart, 1);
    y += ((ystart - y) * 0.2);
    if (y == ystart)
        instance_destroy();
}
