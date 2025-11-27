if (con == 0)
{
    con = 9;
    alarm[0] = 210;
    global.currentsong[0] = snd_init("flashback_excerpt.ogg");
    global.currentsong[1] = mus_loop(global.currentsong[0]);
    scr_lerpvar_instance(id, "overlay_alpha_a", 1, 0, 120);
}
if (con == 10)
{
    con = 19;
    alarm[0] = 30;
    global.typer = 31;
    msgsetloc(0, "You see^1, Susie. You and Kris&live in the \"Light World.\"/", "obj_ch3_PGS01D_slash_Step_0_gml_20_0");
    msgnextloc("A place where everything is as you see./%", "obj_ch3_PGS01D_slash_Step_0_gml_21_0");
    create_writer = true;
}
if (con == 20 && !i_ex(obj_writer))
{
    con = 29;
    alarm[0] = 120;
    scr_lerpvar_instance(id, "normal_alpha", 1, 0, 120);
    scr_lerpvar_instance(id, "dark_alpha", 0, 1, 120);
    snd_play_x(snd_crowd_laugh, 0.3, 1.1);
    global.typer = 31;
    msgsetloc(0, "That is..^6. as long as there's light./", "obj_ch3_PGS01D_slash_Step_0_gml_36_0");
    msgnextloc("You see^1, when it gets dark.../%", "obj_ch3_PGS01D_slash_Step_0_gml_37_0");
    var writer = instance_create(__view_get(e__VW.XView, 0) + 80, __view_get(e__VW.YView, 0) + 320, obj_writer);
    writer.rate = 2;
    writer.skippable = 0;
    writer.depth = depth - 10;
}
if (con == 30 && !i_ex(obj_writer))
{
    con = 35;
    alarm[0] = 60;
    scr_lerpvar_instance(id, "chair_alpha", 1, 0, 120);
    scr_lerpvar_instance(id, "distort_alpha", 0, 1, 120);
    global.typer = 31;
    msgsetloc(0, "Things become^4 more indistinct./", "obj_ch3_PGS01D_slash_Step_0_gml_55_0");
    msgnextloc("A chair can look like a monster./", "obj_ch3_PGS01D_slash_Step_0_gml_56_0");
    msgnextloc("A poster can look like it's moving./", "obj_ch3_PGS01D_slash_Step_0_gml_57_0");
    msgnextloc("Your eyes can't see the truth anymore./%", "obj_ch3_PGS01D_slash_Step_0_gml_58_0");
    var writer = instance_create(__view_get(e__VW.XView, 0) + 80, __view_get(e__VW.YView, 0) + 320, obj_writer);
    writer.rate = 2;
    writer.skippable = 0;
    writer.depth = depth - 10;
}
if (con == 36 && !i_ex(obj_writer))
{
    con = 39;
    alarm[0] = 60;
    scr_lerpvar_instance(id, "overlay_alpha_a", 0, 1, 120);
    snd_play_x(snd_crowd_laugh, 0.5, 0.9);
    global.typer = 31;
    msgsetloc(0, "And when the light runs out.../%", "obj_ch3_PGS01D_slash_Step_0_gml_75_0");
    create_writer = true;
}
if (con == 40 && !i_ex(obj_writer) && overlay_alpha_a == 1)
{
    con = 41;
    alarm[0] = 60;
    global.typer = 31;
    msgsetloc(0, "You see nothing./", "obj_ch3_PGS01D_slash_Step_0_gml_85_0");
    msgnextloc("Of course^1, your mind can't make anything of nothing./%", "obj_ch3_PGS01D_slash_Step_0_gml_86_0");
    create_writer = true;
}
if (con == 42 && !i_ex(obj_writer))
{
    con = 45;
    alarm[0] = 90;
}
if (con == 46 && !i_ex(obj_writer))
{
    con = 49;
    alarm[0] = 60;
    global.typer = 31;
    msgsetloc(0, "But what if?/", "obj_ch3_PGS01D_slash_Step_0_gml_102_0");
    msgnextloc("What if it became even darker?/%", "obj_ch3_PGS01D_slash_Step_0_gml_103_0");
    create_writer = true;
}
if (con == 50 && !i_ex(obj_writer))
{
    con = 51;
    alarm[0] = 1;
    fountain_cover.visible = 1;
    overlay_alpha_b = 1;
    distort_alpha = 0;
    dark_alpha = 0;
    darker____alpha = 1;
    dark_fountain.visible = 1;
    dark_cover.visible = 1;
}
if (con == 52 && !i_ex(obj_writer))
{
    con = 59;
    alarm[0] = 60;
    scr_lerpvar_instance(fountain_cover, "image_alpha", 1, 0, 60);
    global.typer = 31;
    msgsetloc(0, "Darker than dark./", "obj_ch3_PGS01D_slash_Step_0_gml_133_0");
    msgnextloc("What if we could take away&the light that wasn't there/", "obj_ch3_PGS01D_slash_Step_0_gml_134_0");
    msgnextloc("Until we reached another side?/", "obj_ch3_PGS01D_slash_Step_0_gml_135_0");
    msgnextloc("If that were to happen.../%", "obj_ch3_PGS01D_slash_Step_0_gml_136_0");
    create_writer = true;
}
if (con == 60 && !i_ex(obj_writer))
{
    con = 61;
    alarm[0] = 60;
    scr_lerpvar_instance(fountain_cover, "image_alpha", 0, 1, 60);
}
if (con == 62)
{
    con = 63;
    alarm[0] = 90;
    dark_fountain.visible = 0;
    dark_cover.visible = 0;
    scr_lerpvar_instance(id, "overlay_alpha_b", 1, 0, 60);
    scr_lerpvar_instance(fountain_cover, "image_alpha", 1, 0, 60);
}
if (con == 64)
{
    con = 65;
    alarm[0] = 60;
    scr_lerpvar_instance(id, "darker_alpha", 0, 1, 60);
    scr_script_delayed(scr_lerpvar_instance, 61, id, "darker_door_alpha", 0, 1, 60);
    scr_script_delayed(scr_lerpvar_instance, 122, id, "darker_eye_alpha", 0, 1, 60);
    scr_script_delayed(scr_lerpvar_instance, 183, id, "darker_hands_alpha", 0, 1, 60);
    snd_play_x(snd_crowd_laugh, 0.6, 0.8);
    global.typer = 31;
    msgsetloc(0, "You could start to see things again./%", "obj_ch3_PGS01D_slash_Step_0_gml_177_0");
    create_writer = true;
}
if (con == 66 && !i_ex(obj_writer) && darker_hands_alpha == 1)
{
    con = 69;
    alarm[0] = 60;
    watersong[0] = snd_init("ambientwater_weird.ogg");
    watersong[1] = mus_loop(watersong[0]);
    scr_lerpvar_instance(id, "darker_river_alpha", 0, 1, 60);
    global.typer = 31;
    msgsetloc(0, "And hear them./%", "obj_ch3_PGS01D_slash_Step_0_gml_192_0");
    create_writer = true;
}
if (con == 70 && !i_ex(obj_writer))
{
    con = 79;
    alarm[0] = 60;
    scr_lerpvar_instance(id, "darker____face_alpha", 0, 1, 60);
    global.typer = 31;
    msgsetloc(0, "And feel them./%", "obj_ch3_PGS01D_slash_Step_0_gml_205_0");
    create_writer = true;
}
if (con == 80 && !i_ex(obj_writer) && darker____face_alpha == 1)
{
    con = 99;
    alarm[0] = 30;
    darker_zoom = true;
    laugh_play = true;
}
if (laugh_play)
{
    laugh_timer++;
    if (laugh_timer == 1)
    {
        snd_play_x(snd_crowd_laugh, laugh_volume, laugh_pitch);
        laugh_volume -= 0.1;
        laugh_pitch -= 0.1;
    }
    if (laugh_timer == 7)
        laugh_timer = 0;
}
if (con == 100 && darker_zoom_timer >= 120)
{
    con = 109;
    alarm[0] = 30;
    darker_zoom = false;
    laugh_play = false;
}
if (con == 110)
{
    con = 111;
    alarm[0] = 90;
    mus_volume(watersong[1], 0, 30);
}
if (con == 112)
{
    con = 999;
    global.plot = 40;
    snd_free(watersong[0]);
    room_goto(room_dw_nondescript_field);
}
if (create_writer)
{
    create_writer = false;
    var writer = instance_create(__view_get(e__VW.XView, 0) + 80, __view_get(e__VW.YView, 0) + 320, obj_writer);
    writer.rate = 2;
    writer.depth = fountain_cover.depth - 10;
}
if (darker_zoom)
{
    darker_zoom_timer++;
    if (darker_zoom_timer == 1)
    {
        var quantity_zoom = instance_create(320, darker_y_pos - 10, obj_sprite_zoom_example);
        with (quantity_zoom)
            zoomcon = 1;
    }
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
