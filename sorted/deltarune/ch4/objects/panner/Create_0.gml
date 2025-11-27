panx = 0;
pany = 0;
startx = __view_get(e__VW.XView, 0);
starty = __view_get(e__VW.YView, 0);
finalx = x;
finaly = y;
panmax = 1;
pantimer = 0;
type = 0;

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
