if (piano_finish)
    exit;
if (audio_is_playing(piano_song[1]))
{
    var track_progress = audio_sound_get_track_position(piano_song[1]);
    var track_progress_normal = (track_progress - 0) / (audio_sound_length(piano_song[1]) - 0.75 - 0);
    kris_marker.image_index = 524 * track_progress_normal;
    var done_playing = track_progress_normal >= 1;
    if (done_playing)
        piano_finish = true;
}
else
{
    piano_finish = true;
}
