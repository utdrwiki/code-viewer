if (wall_destroy == 1)
{
    if (x < (__view_get(e__VW.XView, 0) - 40))
        instance_destroy();
    if (x > (__view_get(e__VW.XView, 0) + 680))
        instance_destroy();
    if (y < (__view_get(e__VW.YView, 0) - 40))
        instance_destroy();
    if (y > (__view_get(e__VW.YView, 0) + 520))
        instance_destroy();
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
