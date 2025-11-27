if (scr_debug())
{
    if (sunkus_kb_check_pressed(82))
    {
        snd_free_all();
        room_restart();
    }
}
if (con == 0)
{
    JA_XOFF = 0;
    con = 1;
    alarm[4] = 220;
    fin = instance_create(0, 0, obj_fadein);
    with (fin)
        fadespeed = -0.005;
    with (blackall)
        visible = 0;
}
if (con == 1)
{
    y -= 1;
    image_index = susindex;
    susindex += 0.1;
    susy -= 1;
    global.interact = 1;
}
if (con == 2)
{
    image_speed = 0;
    image_index = 0;
    susindex = 0;
    con = 2.1;
    alarm[4] = 60;
}
if (con == 3.1)
{
    JA_XOFF = langopt(0, 50);
    global.typer = 79;
    global.msg[0] = stringsetloc("The Knight.../", "obj_ch4_PDC01A_slash_Step_0_gml_52_0");
    global.msg[1] = stringsetloc("The Roaring Knight.../", "obj_ch4_PDC01A_slash_Step_0_gml_53_0");
    global.msg[2] = stringsetloc(".../", "obj_ch4_PDC01A_slash_Step_0_gml_54_0");
    global.msg[3] = stringsetloc("The one who's\nmaking the dark./", "obj_ch4_PDC01A_slash_Step_0_gml_55_0");
    global.msg[4] = stringsetloc("The one who's\ntrying to destroy\nthe world.../", "obj_ch4_PDC01A_slash_Step_0_gml_56_0");
    global.msg[5] = stringsetloc("..^1. so that's our enemy./%", "obj_ch4_PDC01A_slash_Step_0_gml_57_0");
    instance_create(100 + JA_XOFF, 80, obj_writer);
    con = 4;
}
if (con == 4 && !instance_exists(obj_writer))
{
    con = 5;
    alarm[4] = 30;
    sussprite = spr_susier_bright;
}
if (con == 6 && !i_ex(obj_writer))
{
    con = 7;
    global.msg[0] = stringsetloc("Up until today.../%", "obj_ch4_PDC01A_slash_Step_0_gml_76_0");
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
    global.msg[0] = stringsetloc("It felt kind of like\nno matter how serious\nour adventures got.../", "obj_ch4_PDC01A_slash_Step_0_gml_92_0");
    global.msg[1] = stringsetloc("They were just part\nof another world./%", "obj_ch4_PDC01A_slash_Step_0_gml_93_0");
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
    global.msg[0] = stringsetloc(".../", "obj_ch4_PDC01A_slash_Step_0_gml_111_0");
    global.msg[1] = stringsetloc("But now... someone's\ntaken Undyne... into\nthe shelter./", "obj_ch4_PDC01A_slash_Step_0_gml_112_0");
    global.msg[2] = stringsetloc("The real shelter./%", "obj_ch4_PDC01A_slash_Step_0_gml_113_0");
    instance_create(100 + JA_XOFF, 80, obj_writer);
}
if (con == 14 && !i_ex(obj_writer))
{
    con = 15;
    alarm[4] = 40;
    sussprite = spr_susier_bright;
}
if (con == 16 && !i_ex(obj_writer))
{
    con = 17;
    global.msg[0] = stringsetloc("Kris... we have to\ndo something, before\nshe's.../%", "obj_ch4_PDC01A_slash_Step_0_gml_129_0");
    instance_create(100 + JA_XOFF, 80, obj_writer);
}
if (con == 17 && !i_ex(obj_writer))
{
    con = 18;
    alarm[4] = 40;
    sussprite = spr_susieu_bright;
}
if (con == 19 && !i_ex(obj_writer))
{
    con = 20;
    global.msg[0] = stringsetloc(".../", "obj_ch4_PDC01A_slash_Step_0_gml_146_0");
    global.msg[1] = stringsetloc("... there's no point\ntalking about it./%", "obj_ch4_PDC01A_slash_Step_0_gml_147_0");
    instance_create(100 + JA_XOFF, 80, obj_writer);
}
if (con == 20 && !i_ex(obj_writer))
{
    con = 22;
    alarm[4] = 40;
    sussprite = spr_susier_bright;
}
if (con == 23 && !i_ex(obj_writer))
{
    con = 24;
    global.msg[0] = stringsetloc("Kris! Hurry up and\nseal the fountain!/", "obj_ch4_PDC01A_slash_Step_0_gml_163_0");
    global.msg[1] = stringsetloc("It's time to wake\nup.../", "obj_ch4_PDC01A_slash_Step_0_gml_164_0");
    global.msg[2] = stringsetloc("Kris, are you\nlistening?/%", "obj_ch4_PDC01A_slash_Step_0_gml_165_0");
    instance_create(100 + JA_XOFF, 80, obj_writer);
}
if (con == 24 && !i_ex(obj_writer))
{
    con = 25;
    alarm[4] = 40;
    sussprite = spr_susieu_bright;
}
if (con == 26 && !i_ex(obj_writer))
{
    con = 50;
    global.msg[0] = stringsetloc("It's time to.../%", "obj_ch4_PDC01A_slash_Step_0_gml_181_0");
    var writer = instance_create(100 + JA_XOFF, 80, obj_writer);
    writer.skippable = 0;
    writer.rate = 2;
}
if (con == 50 && !instance_exists(obj_writer))
{
    con = 99;
    snd_free_all();
    made = 1;
    global.plot = 5;
    global.darkzone = 0;
    scr_become_light();
    with (obj_border_controller)
    {
        set_border(border_lw_town, 1);
        show_border(1);
    }
    room_goto(room_torhouse);
}
