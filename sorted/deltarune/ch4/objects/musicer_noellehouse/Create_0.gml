side_b = scr_sideb_active();
if (!snd_is_playing(global.currentsong[1]))
{
    if (global.plot < 55 || global.plot >= 61 || scr_flag_get(737) == 1 || (side_b && global.plot >= 61))
        exit;
    global.currentsong[0] = snd_init("noelle_house_wip.ogg");
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.9, 1);
}
else if (global.plot < 55 || scr_flag_get(737) == 1 || (side_b && global.plot >= 61))
{
    snd_free(global.currentsong[0]);
}
