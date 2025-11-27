timer = 0;
con = 1;
depth = 1000200;
x = __view_get(e__VW.XView, 0) + 545 + 12;
image_xscale = 2;
image_yscale = 2;
rotation = random_range(2, 4) * choose(-1, 1);
image_speed = 0;
sprite_index = spr_cutscene_26_rock_dog;
dog = false;

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
