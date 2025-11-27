if (scr_is_switch_os())
    instance_create(0, 0, obj_switchAsyncHelper);
con = 0;
timer = 0;
lyric = stringset(" ");
textalpha = 1;
creditalpha = 1;
trackpos = 0;
modifier = 0;
song1 = 0;
menugray = hexcolor(#949494);
y_pos = __view_get(e__VW.YView, 0);
x_pos = __view_get(e__VW.XView, 0) + (__view_get(e__VW.WView, 0) / 2);
line_height = 20;
title_credit[0] = stringsetloc("DELTARUNE", "obj_credits_ch3_slash_Create_0_gml_18_0");
title_credit[1] = stringsetloc("Chapter 3", "obj_credits_ch3_slash_Create_0_gml_19_0");
title_credit[2] = stringset(" ");
title_credit[3] = stringsetloc("by Toby Fox", "obj_credits_ch3_slash_Create_0_gml_21_0");
continued_text[0] = stringsetloc("To be continued", "obj_credits_ch3_slash_Create_0_gml_23_0");
credit_index = -1;
credits = generate_credits();
paused = false;

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
