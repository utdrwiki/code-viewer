if (track1_instance == -4)
    exit;
var oldtrackpos = trackpos;
trackpos = audio_sound_get_track_position(track1_instance);
if (i_ex(obj_rhythmgame) && obj_rhythmgame.safety_mode)
    trackpos = obj_rhythmgame.trackpos;
if (oldtrackpos > trackpos && loop)
{
    con = 0;
    next_beat = scr_ceil_to_beat((trackpos + 0.001) - delta_time, bpm, 1, beat_offset * (60 / bpm));
    while (con < event_count && trackpos > event_time[con])
        con++;
}
if (con < event_count && trackpos >= event_time[con])
{
    while (con < event_count && trackpos >= event_time[con])
    {
        if (event_var[con] == "event")
        {
            with (event_id[con])
                event_user(other.event_value[con]);
        }
        else
        {
            variable_instance_set(event_id[con], event_var[con], event_value[con]);
        }
        con++;
    }
}
if (beat_event && trackpos >= next_beat)
{
    if (beat_var == "event")
    {
        with (beat_id)
            event_user(other.beat_value);
    }
    else
    {
        variable_instance_set(beat_id, beat_var, beat_value);
    }
    next_beat = scr_ceil_to_beat(trackpos + 0.001, bpm, 1, beat_offset * (60 / bpm));
}
if (loop && auto_loop && loop_end > 0 && trackpos >= loop_end)
    audio_sound_set_track_position(track1_instance, loop_start + (trackpos - loop_end));
