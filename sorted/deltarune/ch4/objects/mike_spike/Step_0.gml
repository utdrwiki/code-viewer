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
else if (!scr_outside_camera(32))
{
    wall_destroy = 1;
}
if (scr_outside_camera(0) && homing)
    x = obj_heart.x + 8;
if (y < (cameray() + 8))
{
    wait = scr_approach(wait, 0, 1);
    if (wait == 0)
        y += (((cameray() + 10) - y) * 0.1);
}
else
{
    wait += 1;
    if (wait == 5)
    {
        sound_play(snd_spike_fall);
        gravity = 0.5;
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
