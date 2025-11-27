if (con == 0)
{
    global.interact = 1;
    con = 1;
    alarm[0] = 90;
}
if (con == 2 && !i_ex(obj_writer))
{
    con = 3;
    alarm[0] = 30;
    global.typer = 31;
    msgsetloc(0, "..^1. an illusion./", "obj_ch3_PGS01E_classroom_slash_Step_0_gml_15_0_b");
    msgnextloc("The Dark Fountains change everything into a fantasy./%", "obj_ch3_PGS01E_classroom_slash_Step_0_gml_16_0");
    create_writer = true;
}
if (con == 4 && !i_ex(obj_writer))
{
    con = 5;
    alarm[0] = 90;
    scr_lerp_var_instance(blackall, "image_alpha", 0, 1, 60);
}
if (con == 6)
{
    con = 999;
    room_goto(room_dw_nondescript_hallway);
}
if (create_writer)
{
    create_writer = false;
    var writer = instance_create(__view_get(e__VW.XView, 0) + 80, __view_get(e__VW.YView, 0) + 340, obj_writer);
    writer.rate = 2;
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
