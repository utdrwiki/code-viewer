if (hitted == 0)
{
    image_speed = 0;
    image_index = 1;
    hitted = 1;
    hspeed = 12;
    vspeed = -12;
    depth = -999999;
    snd_stop(snd_smallcar_yelp);
    snd_stop(snd_hitcar_little);
    audio_play_sound(snd_smallcar_yelp, 0, 0);
    audio_play_sound(snd_hitcar_little, 0, 0);
}
