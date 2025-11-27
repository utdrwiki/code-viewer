timer++;
if (dir == 0)
{
    if (timer == 1)
        fakespeed = 10;
    target.x += fakespeed;
    fakespeed -= 5;
    if (timer == 6)
        target.x = target.xstart;
}
if (dir == 180)
{
    if (timer == 1)
        fakespeed = -10;
    target.x += fakespeed;
    fakespeed += 4;
    if (timer == 6)
        target.x = target.xstart;
}
if (timer == 6)
    instance_destroy();
