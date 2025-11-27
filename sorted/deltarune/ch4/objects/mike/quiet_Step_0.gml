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
else if (!scr_outside_camera(0))
{
    wall_destroy = 1;
}
wait += 1;
if (wait > wait_time)
{
    y = scr_approach(y, ystart, 10);
    if (y == ystart)
        instance_destroy();
}
else if (wait > (wait_time / 2))
{
    y += (((cameray() + 250) - y) * 0.15);
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
