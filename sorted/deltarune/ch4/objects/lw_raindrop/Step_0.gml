if (!init)
{
    if (hspeed > 0)
        maxx += xbuffer;
    else
        minx += -xbuffer;
    init = true;
}
if ((y - cameray()) >= 280)
    instance_destroy();
else if (x >= (camerax() + maxx))
    x -= (320 + xbuffer);
else if (x <= (camerax() + minx))
    x += (320 + xbuffer);
