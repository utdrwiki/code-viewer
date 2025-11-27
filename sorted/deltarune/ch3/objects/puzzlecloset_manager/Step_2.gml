if (camcontrol == true)
{
    obj_mainchara.cutscene = true;
    var xclamp = 600;
    if (room == room_dw_puzzlecloset_1)
        xclamp = 488;
    if (room == room_dw_puzzlecloset_2 || room == room_dw_puzzlecloset_3)
        xclamp = 800;
    var desiredx = (obj_mainchara.x - floor(__view_get(e__VW.WView, 0) / 2)) + 10 + 8;
    camerax_set(desiredx);
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
