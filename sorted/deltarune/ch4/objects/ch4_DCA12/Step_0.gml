if (songplay == 2)
{
    global.currentsong[0] = snd_init("wind_highplace.ogg");
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.8, 0.9);
    songplay = 3;
}
if (songplay == 1)
{
    snd_free_all();
    songplay = 2;
}
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
    alarm[4] = 110;
}
if (con == 1)
{
    y -= 2;
    image_index = susindex;
    susindex += 0.2;
    susy -= 2;
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
    global.msg[0] = stringsetloc("The DARK FOUNTAIN.../", "obj_ch4_DCA12_slash_Step_0_gml_58_0");
    global.msg[1] = stringsetloc(".../", "obj_ch4_DCA12_slash_Step_0_gml_59_0");
    global.msg[2] = stringsetloc("Why..^1. Aren't they&stopping us from&sealing it...?/%", "obj_ch4_DCA12_slash_Step_0_gml_60_0");
    instance_create(100 + JA_XOFF, 80, obj_writer);
    con = 3.2;
}
if (con == 3.2 && !instance_exists(obj_writer))
{
    con = 4;
    alarm[4] = 30;
}
if (con == 5 && !instance_exists(obj_writer))
{
    global.msg[0] = stringsetloc("..^1. Well^1, guess I'm not complaining./%", "obj_ch4_DCA12_slash_Step_0_gml_104_0");
    instance_create(100 + JA_XOFF, 80, obj_writer);
    con = 6;
}
if (con == 6 && !instance_exists(obj_writer))
{
    sussprite = spr_susieu_bright;
    global.msg[0] = stringsetloc("Kris..^1. do your thing./%", "obj_ch4_DCA12_slash_Step_0_gml_115_0");
    instance_create(100 + JA_XOFF, 80, obj_writer);
    con = 7;
    alarm[4] = 40;
}
if (con == 8 && !instance_exists(obj_writer))
{
    con = 99;
    snd_free_all();
    made = 1;
    global.plot = 200;
    instance_create(x + (sprite_width / 2), y + (sprite_width / 2) + 20, obj_ch4_DCA12_darkfountain_event);
}
