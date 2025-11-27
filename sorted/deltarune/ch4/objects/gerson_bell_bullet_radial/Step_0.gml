timer++;
if (type == 0)
{
    var statetimer = 12;
    if (timer <= statetimer)
    {
        fakespeed = lerp(16, 4, timer / statetimer);
        dirspeed = lerp(2.25, 1.5, timer / statetimer);
    }
    if (timer > statetimer)
    {
        fakespeed = lerp(4, 16, (timer - statetimer) / statetimer);
        dirspeed = lerp(1.5, 2.25, (timer - statetimer) / statetimer);
    }
    if (timer > 24)
        image_alpha -= 0.1;
}
if (type == 1)
{
    var statetimer = 12;
    if (timer <= statetimer)
    {
        fakespeed = lerp(14, 3, timer / statetimer);
        dirspeed = lerp(3, 1.25, timer / statetimer);
    }
    if (timer > statetimer)
    {
        fakespeed = lerp(3, 9, (timer - statetimer) / statetimer);
        dirspeed = lerp(1.25, 1.75, (timer - statetimer) / statetimer);
    }
    if (timer > 40)
        image_alpha -= 0.1;
}
x = xstart + lengthdir_x(length, place);
y = ystart + lengthdir_y(length, place);
length += fakespeed;
place += dirspeed;
if (global.turntimer < 1)
    instance_destroy();
if (image_alpha < 0)
    instance_destroy();
if (x < (__view_get(e__VW.XView, 0) - 80))
    instance_destroy();
if (x > (__view_get(e__VW.XView, 0) + 760))
    instance_destroy();
if (y < (__view_get(e__VW.YView, 0) - 80))
    instance_destroy();
if (y > (__view_get(e__VW.YView, 0) + 580))
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
