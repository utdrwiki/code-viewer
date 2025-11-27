if (global.chapter <= 1)
{
    if (global.plot <= 30)
    {
        if (!snd_is_playing(global.currentsong[1]))
        {
            global.currentsong[0] = snd_init("creepydoor.ogg");
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
        }
    }
    if (global.plot > 30)
    {
        global.currentsong[0] = snd_init("castletown_empty.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
    }
}
if (global.chapter > 2)
{
    var recruited_all = scr_recruited_all_previous();
    if (!snd_is_playing(global.currentsong[1]))
    {
        var audio_file = recruited_all ? "castle_funk_long.ogg" : "castletown.ogg";
        if (room == room_dw_castle_town && global.flag[1661] > 0 && global.plot >= 240)
            audio_file = "lancer_annoying.ogg";
        global.currentsong[0] = snd_init(audio_file);
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
    }
    else if (global.flag[1661] > 0 && global.plot >= 240)
    {
        if (room == room_dw_castle_town)
        {
            snd_free_all();
            var audio_file = "lancer_annoying.ogg";
            global.currentsong[0] = snd_init(audio_file);
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
        }
    }
}
