ss = 0.5;
ssy = 0.5;
auto = 0;
autoy = 0;
shadoweffect = 0;
init = 0;
siner = 0;
accounty = 0;
crazy = 0;
xoff = (__view_get(e__VW.XView, 0) * ss) + xstart;
yoff = (__view_get(e__VW.YView, 0) * ssy) + ystart;
windowbg = 2925;
spritewidth = sprite_get_width(windowbg);
spriteheight = sprite_get_height(windowbg);

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
