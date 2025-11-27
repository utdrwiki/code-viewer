damage = 206;
grazepoints = 50;
if (!alarm[0])
{
    width *= 0.66;
    image_alpha *= 0.66;
}
if (width < 12)
    active = false;
if (width < 0.5)
    instance_destroy();
if (width > 4)
{
    with (obj_growtangle)
    {
        x = xstart + choose(-2, -1, 0, 1, 2);
        y = ystart + choose(-2, -1, 0, 1, 2);
    }
    scr_heartclamp();
}
