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
if (type == 0)
{
    if (instance_number(obj_mike_quiet) > 0)
    {
        var _ob = instance_nearest(x, y, obj_mike_quiet);
        if (point_distance(x, y, x, _ob.y) < 300)
            vspeed += 3;
    }
    if ((hspeed > 0 && x > (camerax() + (camerawidth() / 2))) || ((hspeed < 0 && x < (camerax() + (camerawidth() / 2))) && obj_mike_controller.type < 3))
        friction = -0.5;
    if (vspeed == 0)
        y = ystart + (sin((xstart * 2) + (current_time / (400 + (type * 200)))) * wave_height);
}
if (type == 2)
{
    wait += 1;
    hspeed = 0;
    if (wait > 150)
    {
        y = scr_approach(y, ystart, 24);
        if (y == ystart)
            instance_destroy();
    }
    else if (wait > 15)
    {
        y = scr_approach(y, cameray() + (ytarget + (sin((xstart * 2) + (current_time / 400)) * 10)), wave_speed);
    }
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
