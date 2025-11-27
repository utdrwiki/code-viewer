with (obj_mainchara_board)
    x = clamp(x, 288, 640);
if (global.flag[1112] == 1)
    camcontrol = false;
if (camcontrol == true)
{
    obj_mainchara.cutscene = true;
    var xclamp = 76;
    var desiredx = (obj_mainchara.x - floor(__view_get(e__VW.WView, 0) / 2)) + 10 + 8;
    camerax_set(round(desiredx));
    camerax_set(clamp(camerax(), 0, xclamp));
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
