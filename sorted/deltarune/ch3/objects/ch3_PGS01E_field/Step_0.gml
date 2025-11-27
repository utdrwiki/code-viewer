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
    msgsetloc(0, "That is the Dark World^1, Susie./", "obj_ch3_PGS01E_field_slash_Step_0_gml_15_0");
    msgnextloc("An alternate view of reality through the lens of shadow./%", "obj_ch3_PGS01E_field_slash_Step_0_gml_16_0");
    create_writer = true;
}
if (con == 4 && !i_ex(obj_writer))
{
    con = 5;
    alarm[0] = 30;
    global.typer = 31;
    msgsetloc(0, "In other words..^1./%", "obj_ch3_PGS01E_field_slash_Step_0_gml_25_0");
    create_writer = true;
}
if (con == 6 && !i_ex(obj_writer))
{
    con = 7;
    alarm[0] = 30;
    snd_play(snd_revival);
    var glow = instance_create(0, 0, obj_ch3_PGS01E_white_glow);
}
if (con == 20)
{
    con = 999;
    room_goto(room_dw_nondescript_classroom);
}
if (create_writer)
{
    create_writer = false;
    var writer = instance_create(__view_get(e__VW.XView, 0) + 80, __view_get(e__VW.YView, 0) + 320, obj_writer);
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
