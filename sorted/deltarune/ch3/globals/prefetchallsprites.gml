function scr_prefetchallsprites()
{
    show_debug_message("=========");
    show_debug_message("started sprite prefetch: " + string(get_timer()));
    for (var i = 0; sprite_exists(i); i++)
        sprite_prefetch(i);
    show_debug_message("prefetched all sprites: " + string(get_timer()));
    show_debug_message("=========");
}

function scr_prefetchallsounds()
{
    audio_group_load(1);
    audio_group_load(0);
    var soundcount = 0;
    for (var i = 0; audio_exists(i); i++)
    {
        snd_play_x(i, 0, 0);
        snd_stop(i);
        soundcount++;
    }
}
