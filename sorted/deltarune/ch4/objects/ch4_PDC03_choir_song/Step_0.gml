if (start_song)
{
    start_song = false;
    choir_song[1] = audio_play_sound(choir_song[0], 90, 0);
    alarm[5] = 25;
    exit;
}
if (global.lang == "ja")
{
    if (instance_exists(myd))
    {
        timer++;
        if (timer == 800)
            myd.rate = 3;
    }
}
if (song_started && !i_ex(obj_writer))
{
    song_started = false;
    snd_free(choir_song[0]);
    instance_destroy();
}
