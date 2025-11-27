if (scr_get_total_recruits(2) > 0)
{
    global.currentsong[0] = snd_init("queen_car_radio.ogg");
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
}
