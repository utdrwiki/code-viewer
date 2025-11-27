if (!snd_is_playing(global.currentsong[1]))
{
    if (global.chapter == 4 && (global.plot < 20 || global.plot >= 300))
        exit;
    global.currentsong[0] = snd_init("home.ogg");
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
}
