if (con == 0)
{
    con = 1;
    alarm[0] = 90;
    global.interact = 1;
}
if (con == 2 && !i_ex(obj_writer))
{
    con = 3;
    alarm[0] = 30;
    create_writer = true;
}
if (con == 4 && !i_ex(obj_writer))
{
    con = 5;
    alarm[0] = 30;
    with (obj_ch3_BTB05_screenbloom)
        disappeared = true;
    create_writer = true;
}
if (con == 6)
{
    if (obj_ch3_BTB05_screenbloom.disappear_index < 5)
    {
        if (!obj_ch3_BTB05_screenbloom.disappeared)
            obj_ch3_BTB05_screenbloom.disappeared = true;
    }
    else
    {
        con = 7;
        alarm[0] = 30;
    }
}
if (con == 8 && !i_ex(obj_writer) && !obj_ch3_BTB05_screenbloom.disappeared)
{
    con = 9;
    alarm[0] = 30;
    create_writer = true;
}
if (con == 10 && !i_ex(obj_writer))
{
    con = 11;
    alarm[0] = 60;
}
if (con == 12)
{
    con = 13;
    alarm[0] = 30;
    with (obj_ch3_BTB05_screenbloom)
        disappeared = true;
}
if (con == 14 && !i_ex(obj_writer) && !obj_ch3_BTB05_screenbloom.disappeared)
{
    con = 15;
    alarm[0] = 30;
}
if (con == 16)
{
    con = 17;
    alarm[0] = 30;
    create_writer = true;
}
if (con == 18 && !i_ex(obj_writer) && !obj_ch3_BTB05_screenbloom.disappeared)
{
    con = 19;
    alarm[0] = 30;
    with (obj_ch3_BTB05_screenbloom)
        disappeared = true;
}
if (con == 20 && !i_ex(obj_writer) && !obj_ch3_BTB05_screenbloom.disappeared)
{
    con = 21;
    alarm[0] = 30;
    create_writer = true;
}
if (con == 22 && !i_ex(obj_writer))
{
    con = 23;
    alarm[0] = 30;
    with (obj_ch3_BTB05_screenbloom)
        disappeared = true;
}
if (con == 24 && !obj_ch3_BTB05_screenbloom.disappeared)
{
    con = 25;
    alarm[0] = 30;
}
if (con == 26 && !i_ex(obj_writer) && !obj_ch3_BTB05_screenbloom.disappeared)
{
    con = 27;
    alarm[0] = 60;
    with (obj_ch3_BTB05_screenbloom)
        scr_lerpvar("blackfade", 0, 1, 60);
    snd_volume(global.currentsong[1], 0, 60);
}
if (con == 28 && !i_ex(obj_writer) && !obj_ch3_BTB05_screenbloom.disappeared)
{
    con = 29;
    alarm[0] = 30;
    create_writer = true;
}
if (con == 29 && !i_ex(obj_writer))
{
    con = 30;
    alarm[0] = 60;
    with (obj_ch3_BTB05_screenbloom)
        scr_lerpvar("tvstrength", 1, 0, 60);
    if (audio_is_playing(snd_tv_static))
        snd_volume(snd_tv_static, 0, 60);
}
if (con == 31 && !i_ex(obj_writer))
{
    con = 32;
    alarm[0] = 60;
    create_writer = true;
}
if (con == 33 && !i_ex(obj_writer))
{
    con = 34;
    alarm[0] = 60;
    snd_play(snd_noise);
    tv_stand_marker.visible = 1;
    tv_smile_bg_marker.visible = 1;
    tv_smile_marker.visible = 1;
    wind_song[0] = snd_init("wind_highplace.ogg");
    wind_song[1] = mus_loop_ext(wind_song[0], 0.75, 1);
}
if (con == 35)
{
    con = 36;
    alarm[0] = 60;
    create_writer = true;
}
if (con == 37 && !i_ex(obj_writer))
{
    con = 38;
    alarm[0] = 90;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    scr_lerp_instance_var(blackall, "image_alpha", 0, 1, 60);
    snd_volume(wind_song[1], 0, 60);
}
if (con == 39 && !i_ex(obj_writer))
{
    con = 99;
    global.plot = 300;
    snd_free(103);
    snd_free(wind_song[0]);
    room_goto(room_dw_snow_zone_battle);
}
if (create_writer && !i_ex(obj_writer))
{
    create_writer = false;
    global.typer = 80;
    if (speech_index == 0)
    {
        msgsetloc(0, "Back when I was just a little old TV./", "obj_ch3_BTB05_slash_Step_0_gml_203_0");
        msgnextloc("Everyone used to gather around my glow to watch the specials^1,/", "obj_ch3_BTB05_slash_Step_0_gml_204_0");
        msgnextloc("Smiling.^6 Laughing.^6 Eating butterscotch pie./", "obj_ch3_BTB05_slash_Step_0_gml_205_0");
        msgnextloc("Wasn't that just so much..^1. fun?/", "obj_ch3_BTB05_slash_Step_0_gml_206_0");
        msgnextloc("To watch me./", "obj_ch3_BTB05_slash_Step_0_gml_207_0");
        msgnextloc("I..^1. was so happy./", "obj_ch3_BTB05_slash_Step_0_gml_208_0");
        msgnextloc("Then.../%", "obj_ch3_BTB05_slash_Step_0_gml_209_0");
    }
    if (speech_index == 1)
        msgsetloc(0, "People stopped coming./%", "obj_ch3_BTB05_slash_Step_0_gml_214_0");
    if (speech_index == 2)
        msgsetloc(0, "Everyone disappeared..^1. one by one.../%", "obj_ch3_BTB05_slash_Step_0_gml_219_0");
    if (speech_index == 3)
        msgsetloc(0, "No one wanted to watch TV anymore./%", "obj_ch3_BTB05_slash_Step_0_gml_224_0");
    if (speech_index == 4)
        msgsetloc(0, "No one wanted to play games anymore./%", "obj_ch3_BTB05_slash_Step_0_gml_229_0");
    if (speech_index == 5)
        msgsetloc(0, "I've been all alone.../%", "obj_ch3_BTB05_slash_Step_0_gml_234_0");
    if (speech_index == 6)
        msgsetloc(0, "Until now./%", "obj_ch3_BTB05_slash_Step_0_gml_239_0");
    if (speech_index == 7)
    {
        msgsetloc(0, "When the KNIGHT appeared.../", "obj_ch3_BTB05_slash_Step_0_gml_244_0");
        msgnextloc("The ROARING KNIGHT./", "obj_ch3_BTB05_slash_Step_0_gml_245_0");
        msgnextloc("And I was told that if I keep you three busy^1,/", "obj_ch3_BTB05_slash_Step_0_gml_246_0");
        msgnextloc("I can have ALL the people watch me that I want./%", "obj_ch3_BTB05_slash_Step_0_gml_247_0");
    }
    var writer = instance_create(__view_get(e__VW.XView, 0) + 40, __view_get(e__VW.YView, 0) + 60, obj_writer);
    writer.rate = 2;
    speech_index++;
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
