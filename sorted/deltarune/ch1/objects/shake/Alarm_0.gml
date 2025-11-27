if (global.flag[12] == 0)
{
    __view_set(e__VW.XView, camera, camerax + (shakex * shakesign));
    __view_set(e__VW.YView, camera, cameray + (shakey * shakesign));
}
if (permashake == 0)
{
    if (shakex > 0)
        shakex -= 1;
    if (shakey > 0)
        shakey -= 1;
}
shakesign = -shakesign;
alarm[0] = shakespeed;
if (shakex == 0 && shakey == 0)
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
