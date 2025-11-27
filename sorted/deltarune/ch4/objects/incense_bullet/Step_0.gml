if (wall_destroy == 1)
{
    if (x < (__view_get(e__VW.XView, 0) - 80))
        instance_destroy();
    if (x > (__view_get(e__VW.XView, 0) + 760))
        instance_destroy();
    if (y < (__view_get(e__VW.YView, 0) - 80))
        instance_destroy();
    if (y > (__view_get(e__VW.YView, 0) + 580))
        instance_destroy();
}
if (updateimageangle == 1)
    image_angle = direction;
if (spin == 1)
{
    image_angle += spinspeed;
    siner++;
    image_xscale = 1 + (sin(siner / 4) * 10);
    image_yscale = image_xscale;
}
if (bottomfade != 0)
{
    if (y > (cameray() + bottomfade))
        image_alpha *= 0.8;
}

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
