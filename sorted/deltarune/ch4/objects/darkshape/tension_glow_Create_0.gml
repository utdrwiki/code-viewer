apparent = 0;
alphamod = 1;
apparent = global.tension;
current = global.tension;
tsiner = 0;
healthbar_surf = -1;
change = 0;
changetimer = 15;
flashsiner = 0;
maxed = 0;
tamt = 0;
with (obj_tensionbar)
{
    other.x = x;
    other.y = y;
}

draw_w_offset = function(arg0 = 0, arg1 = 0, arg2 = 0)
{
    var xx = x;
    var yy = __view_get(e__VW.YView, 0) + 40;
    var z = 1;
    if (tamt < 100)
    {
        draw_text_color((xx - 30) + arg0, yy + 70 + arg1, string_hash_to_newline(string(floor((apparent / global.maxtension) * 100))), c_white, c_white, c_white, c_white, arg2);
        draw_text_color((xx - 25) + arg0, yy + 95 + arg1, string_hash_to_newline(stringsetloc("%", "obj_tensionbar_slash_Draw_0_gml_18_0")), c_white, c_white, c_white, c_white, arg2);
    }
    else
    {
        draw_text_color((xx - 28) + arg0, yy + 70 + arg1, string_hash_to_newline(stringsetloc("M", "obj_tensionbar_slash_Draw_0_gml_25_0")), c_white, c_white, c_white, c_white, arg2);
        draw_text_color((xx - 24) + arg0, yy + 90 + arg1, string_hash_to_newline(stringsetloc("A", "obj_tensionbar_slash_Draw_0_gml_26_0")), c_white, c_white, c_white, c_white, arg2);
        draw_text_color((xx - 20) + arg0, yy + 110 + arg1, string_hash_to_newline(stringsetloc("X", "obj_tensionbar_slash_Draw_0_gml_27_0")), c_white, c_white, c_white, c_white, arg2);
    }
};

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
