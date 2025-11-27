con = -1;
customcon = 0;
if (global.plot >= 270)
{
    con = 0;
    if (!snd_is_playing(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init("tin_night.ogg");
        global.currentsong[1] = mus_loop(global.currentsong[0]);
    }
    colcol = 0;
    image_speed = 0;
    image_xscale = 2;
    image_yscale = 2;
    siner = 0;
    made = 0;
    adjust = 0;
    global.interact = 1;
    y += 260;
    susx = 290;
    susy = 284;
    sussprite = spr_susieu_bright;
    susindex = 0;
    songplay = 0;
    with (obj_mainchara)
        visible = 0;
    fin = instance_create(0, 0, obj_fadein);
    with (fin)
        fadespeed = -0.005;
}
else
{
    instance_destroy();
}
