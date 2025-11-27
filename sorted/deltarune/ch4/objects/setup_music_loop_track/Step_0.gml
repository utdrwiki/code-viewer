if (introtrack && looptrack)
{
    if (introtrack == global.currentsong[0])
    {
        trackpos = audio_sound_get_track_position(global.currentsong[1]);
        if (snd_is_playing(introtrack) && audio_sound_length(introtrack) < (trackpos + (1/30)))
        {
            global.currentsong[0] = looptrack;
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], volume, pitch);
        }
    }
    else
    {
        if (looptrack != global.currentsong[0])
            snd_free(looptrack);
        snd_free(introtrack);
        instance_destroy(self);
    }
}
