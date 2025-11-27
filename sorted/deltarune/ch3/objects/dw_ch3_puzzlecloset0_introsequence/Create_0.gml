var song = "tv_results_screen.ogg";
if (global.flag[1123] == 1)
{
    scr_musicer(song, 0.7, 0.4);
}
else
{
    global.currentsong[0] = snd_init(song);
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 0.4);
    music = global.currentsong[1];
    volume = 0;
    amount = 0;
    newamount = 0;
}
con = 0;
timer = 0;
cutscene_master = 0;
if (global.plot < 160)
    global.plot = 160;
if (scr_debug())
{
    if (global.flag[1113] < 2)
        global.flag[1113] = 2;
}
if (global.flag[1123] == 1)
{
    instance_destroy();
}
else
{
    scr_setparty(1, 1, 0);
    scr_fadein(60);
}
