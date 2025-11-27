alarm[1] = 3;
canchoose = 0;
dar = global.darkzone + 1;
image_xscale = dar;
image_yscale = dar;
add = __view_get(e__VW.XView, view_current);
x = (89 * dar) + add;
y = (210 * dar) + __view_get(e__VW.YView, view_current);
d = -1;
if (instance_exists(obj_dialoguer))
    d = obj_dialoguer.side;
if (d == -1)
{
    if (obj_mainchara.y > (__view_get(e__VW.YView, view_current) + (130 * dar)))
        y -= (155 * dar);
}
else if (d == 0)
{
    y -= (155 * dar);
}
mychoice = 0;
global.choice = -1;
choiced = 0;

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
