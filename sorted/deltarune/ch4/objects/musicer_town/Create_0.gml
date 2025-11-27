if (global.chapter == 1)
{
    if (global.plot >= 250)
    {
        if (!snd_is_playing(global.currentsong[1]))
        {
            global.currentsong[0] = snd_init("town.ogg");
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.8, 0.97);
        }
    }
}
if (global.chapter == 2)
{
    if (global.plot >= 10 && global.plot != 200)
    {
        if (!snd_is_playing(global.currentsong[1]))
        {
            if (global.plot >= 17 && global.plot <= 25)
                global.currentsong[0] = snd_init("honksong.ogg");
            else
                global.currentsong[0] = snd_init("town.ogg");
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 0.97);
        }
    }
}
if (global.chapter > 2)
{
    var play_song = true;
    var song_file = "town.ogg";
    var pitch = 0.97;
    if (global.chapter == 4)
    {
        song_file = "town_day.ogg";
        if (global.plot < 35 || global.plot >= 95)
            play_song = false;
        if (global.plot >= 290)
        {
            play_song = true;
            song_file = "rain.ogg";
            pitch = 1;
        }
    }
    if (play_song)
    {
        if (!snd_is_playing(global.currentsong[1]))
        {
            global.currentsong[0] = snd_init(song_file);
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, pitch);
        }
    }
}
