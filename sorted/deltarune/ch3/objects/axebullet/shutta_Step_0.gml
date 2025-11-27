if (paused)
    exit;
if (seizure == 0)
{
    counter += 1;
    if (counter >= 3)
    {
        image_angle += 45;
        counter = 0;
    }
}
if (seizure == 1)
    image_angle += 10;
if (x >= (__view_get(e__VW.XView, 0) + 700))
    instance_destroy();

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
