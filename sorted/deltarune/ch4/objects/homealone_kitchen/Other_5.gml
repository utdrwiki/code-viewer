if (audio_exists(piano_song[0]))
{
    if (audio_is_playing(piano_song[0]))
        snd_free(piano_song[0]);
}
if (audio_emitter_exists(emitter))
    audio_emitter_free(emitter);
if (audio_is_playing(snd_paper_surf))
    snd_stop(snd_paper_surf);
