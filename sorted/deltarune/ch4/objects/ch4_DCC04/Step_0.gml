if (songplay == 0)
{
    with (obj_mainchara)
        visible = 0;
    songplay = 1;
}
if (con == 0)
{
    JA_XOFF = 0;
    con = 1;
    alarm[4] = 220;
}
if (con == 1)
{
    y -= 1;
    image_index += 0.1;
    global.interact = 1;
    if (y == 360)
        sussprite = spr_susier_bright;
    if (y <= 352)
    {
        susx -= 1;
        susindex -= 0.2;
    }
}
if (con == 2)
{
    image_speed = 0;
    image_index = 0;
    susindex = 0;
    con = 2.1;
    alarm[4] = 60;
    scr_delay_var("sussprite", 3314, 15);
    scr_delay_var("sprite_index", 3309, 15);
}
if (con == 3.1)
{
    JA_XOFF = langopt(0, 50);
    global.typer = 79;
    sprite_index = spr_krisu_bright;
    scr_speaker("susie");
    msgsetloc(0, "* .../", "obj_ch4_DCC04_slash_Step_0_gml_80_0");
    msgnextloc("* Hey^1, Kris.../", "obj_ch4_DCC04_slash_Step_0_gml_81_0");
    msgnextloc("* .../", "obj_ch4_DCC04_slash_Step_0_gml_82_0");
    msgnextloc("* Can I tell you/", "obj_ch4_DCC04_slash_Step_0_gml_83_0");
    msgnextloc("* ..^1. a stupid dream\nI have?/%", "obj_ch4_DCC04_slash_Step_0_gml_84_0");
    instance_create(100 + JA_XOFF, 80, obj_writer);
    con = 4;
}
if (con == 4 && !instance_exists(obj_writer))
{
    con = 5;
    alarm[4] = 30;
    songplay = 1;
    sussprite = spr_susie_up_head_down_bright;
}
if (con == 6 && !i_ex(obj_writer))
{
    con = 7;
    sussprite = spr_susieu_bright;
    scr_speaker("susie");
    msgsetloc(0, "* .../", "obj_ch4_DCC04_slash_Step_0_gml_109_0");
    msgnextloc("* No matter what/", "obj_ch4_DCC04_slash_Step_0_gml_110_0");
    msgnextloc("* I..^1. want to keep\nbeing friends\nwith you and Ralsei./%", "obj_ch4_DCC04_slash_Step_0_gml_111_0");
    instance_create(100 + JA_XOFF, 80, obj_writer);
}
if (con == 7 && !i_ex(obj_writer))
{
    con = 8;
    alarm[4] = 30;
}
if (con == 9 && !i_ex(obj_writer))
{
    con = 10;
    alarm[4] = 30;
    sussprite = spr_susie_up_head_down_bright;
    scr_speaker("susie");
    msgsetloc(0, "* When the sun\ncomes up again.../", "obj_ch4_DCC04_slash_Step_0_gml_131_0");
    msgnextloc("* I want tomorrow\nto be the same\nas yesterday./", "obj_ch4_DCC04_slash_Step_0_gml_132_0");
    msgnextloc("* And the next day/", "obj_ch4_DCC04_slash_Step_0_gml_133_0");
    msgnextloc("* To be just the\nsame as that./%", "obj_ch4_DCC04_slash_Step_0_gml_134_0");
    instance_create(100 + JA_XOFF, 80, obj_writer);
}
if (con == 11 && !i_ex(obj_writer))
{
    con = 12;
    alarm[4] = 40;
    sussprite = spr_susieu_bright;
}
if (con == 13 && !i_ex(obj_writer))
{
    con = 14;
    sussprite = spr_susie_up_look_right_bright;
    scr_speaker("susie");
    msgsetloc(0, "* That in the end/", "obj_ch4_DCC04_slash_Step_0_gml_155_0");
    msgnextloc("* We can always go back\nto the way things were\nbefore./%", "obj_ch4_DCC04_slash_Step_0_gml_156_0");
    instance_create(100 + JA_XOFF, 80, obj_writer);
}
if (con == 14 && !i_ex(obj_writer))
{
    con = 15;
    alarm[4] = 40;
}
if (con == 16 && !i_ex(obj_writer))
{
    con = 17;
    sussprite = spr_susie_up_head_down_bright;
    scr_speaker("susie");
    msgsetloc(0, "* .../", "obj_ch4_DCC04_slash_Step_0_gml_174_0");
    msgnextloc("* You don't have\nto say anything back^1,\nKris./", "obj_ch4_DCC04_slash_Step_0_gml_175_0");
    msgnextloc("* I.../", "obj_ch4_DCC04_slash_Step_0_gml_176_0");
    msgnextloc("* .../", "obj_ch4_DCC04_slash_Step_0_gml_177_0");
    msgnextloc("* I know.../", "obj_ch4_DCC04_slash_Step_0_gml_178_0");
    msgnextloc("* You're thinking the\nsame thing/%", "obj_ch4_DCC04_slash_Step_0_gml_179_0");
    instance_create(100 + JA_XOFF, 80, obj_writer);
}
if (con == 17 && !i_ex(obj_writer))
{
    con = 18;
    alarm[4] = 40;
    sussprite = spr_susier_bright;
    sprite_index = spr_krisl_bright;
}
if (con == 19 && !instance_exists(obj_writer))
{
    con = 20;
    alarm[4] = 40;
    scr_speaker("susie");
    msgsetloc(0, "* ..^1. aren't you^1, dumbass?/%", "obj_ch4_DCC04_slash_Step_0_gml_199_0");
    instance_create(100 + JA_XOFF, 80, obj_writer);
}
if (con == 21 && !i_ex(obj_writer))
{
    con = 22;
    alarm[4] = 30;
}
if (con == 23)
{
    con = 24;
    alarm[4] = 30;
    global.typer = 42;
    msgsetloc(0, "* (Susie's smile^1, which\nseemed to defeat everything)/", "obj_ch4_DCC04_slash_Step_0_gml_216_0");
    msgnextloc("* (Shined on in front of you^1,\nand for a moment)/", "obj_ch4_DCC04_slash_Step_0_gml_217_0");
    msgnextloc("* (It was as if all\nthe darkness had been\nblown away.)/%", "obj_ch4_DCC04_slash_Step_0_gml_218_0");
    instance_create(100 + JA_XOFF, 80, obj_writer);
}
if (con == 25 && !i_ex(obj_writer))
{
    con = 26;
    alarm[4] = 40;
    sprite_index = spr_krisu_bright;
    sussprite = spr_susieu_bright;
    mus_volume(global.currentsong[1], 0, 60);
}
if (con == 26 && !instance_exists(obj_writer))
{
    y -= 1;
    image_index += 0.1;
}
if (con == 27 && !i_ex(obj_writer))
{
    con = 28;
    global.typer = 42;
    msgsetloc(0, "* (As if in imitation^1,\nyour SOUL began to glow...)/%", "obj_ch4_DCC04_slash_Step_0_gml_246_0");
    instance_create(100 + JA_XOFF, 80, obj_writer);
}
if (con == 28 && !instance_exists(obj_writer))
{
    global.plot = 280;
    snd_free_all();
    made = 1;
    instance_create(x + (sprite_width / 2), y + (sprite_width / 2) + 20, obj_darkfountain_event);
    con = 99;
}
