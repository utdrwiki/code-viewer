if (audio_finish)
    exit;
if (audio_is_playing(tv_sound))
{
    var track_progress = audio_sound_get_track_position(tv_sound);
    var track_progress_normal = (track_progress - 0) / (audio_sound_length(tv_sound) - 0);
    logo_marker.image_index = sprite_get_number(logo_marker.sprite_index) * track_progress_normal;
}
else
{
    audio_finish = true;
    logo_marker.sprite_index = spr_dw_tv_time_intro_loop;
    logo_marker.image_speed = 0.1;
    snd_free(51);
}
