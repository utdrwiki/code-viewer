song_started = true;
global.typer = 41;
global.msg[0] = stringsetloc("Heaven knows^6&the story that we've born^4&from our hearts^2 %", "obj_ch4_PDC03_choir_song_slash_Alarm_5_gml_6_0");
global.msg[1] = stringsetloc("Of the shadows cutting deep^2&and the heroes that save us^4 %", "obj_ch4_PDC03_choir_song_slash_Alarm_5_gml_7_0");
global.msg[2] = stringsetloc("Heaven knows^4&The beauty of the soul^4&and we weep^4 %", "obj_ch4_PDC03_choir_song_slash_Alarm_5_gml_8_0");
global.msg[3] = stringsetloc("To the majesty and^4&pray we not forget^6&the tale of DELTARUNE ^9^9^2 %%", "obj_ch4_PDC03_choir_song_slash_Alarm_5_gml_9_0");
myd = instance_create(__view_get(e__VW.XView, 0) + 40, __view_get(e__VW.YView, 0) + 40, obj_writer);
with (myd)
    skippable = 0;
dhaver = 1;
timer = 0;
if (global.lang == "ja")
    myd.rate = 6;

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
