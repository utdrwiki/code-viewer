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
    con = 7;
    alarm[4] = 60;
}
if (con == 8 && !instance_exists(obj_writer))
{
    con = 99;
    made = 1;
    instance_create(x + (sprite_width / 2), y + (sprite_width / 2) + 20, obj_ch4_churchb_darkfountain_event);
}
