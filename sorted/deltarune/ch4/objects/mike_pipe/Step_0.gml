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
    wait -= 1;
    if (wait < 0)
        image_yscale += (((scale + 40) - image_yscale) * 0.2);
    yscale2 = max(5, image_yscale - 40);
}
else if (!scr_outside_camera(32))
{
    wall_destroy = 1;
}
if (x < obj_mike_controller.x)
    friction = -1;

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
