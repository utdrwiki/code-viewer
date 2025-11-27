if (global.turntimer < 1)
    instance_destroy();
if (paused)
    exit;
if (!speed_set)
{
    speed_goal = speed * 0.33;
    speed_goal_change = abs(speed - speed_goal) * 0.125;
    speed_set = true;
}
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
speed = scr_approach(speed, speed_goal, speed_goal_change);
spin++;
if ((spin % 2) == 0)
    image_angle += 22.5;
if (x < (obj_growtangle.x - (obj_growtangle.sprite_width * 0.5) - 16))
    image_alpha *= 0.8;

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
