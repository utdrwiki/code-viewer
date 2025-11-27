if (dhaver == 1)
{
    with (myd)
    {
        writingx = __view_get(e__VW.XView, 0) + 40;
        writingy = __view_get(e__VW.YView, 0) + 20;
    }
}
if (v == 1)
{
    __view_set(e__VW.XView, 0, c.x - vx);
    __view_set(e__VW.YView, 0, c.y - vy);
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
