my_surface = -4;
xscale = 1;
yscale = 1;
alpha = 0.5;
anchor_x = x - __view_get(e__VW.XView, 0);
anchor_y = y - __view_get(e__VW.YView, 0);
xrate = 0.01;
yrate = 0.01;
faderate = 0.00625;
draw_end = false;

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
