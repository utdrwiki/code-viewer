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
    if (x > (camerax() + 100) && image_angle == 0)
        scale = 120 + (sin(xx + (current_time / 400)) * 8);
    else if (x < (camerax() + camerawidth() + 100) && image_angle == 180)
        scale = 120 + (sin(xx + (current_time / 400)) * 8);
    wait -= 1;
    if (wait < 0)
        image_yscale += ((scale - image_yscale) * 0.2);
}
else if (!scr_outside_camera(32))
{
    wall_destroy = 1;
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
