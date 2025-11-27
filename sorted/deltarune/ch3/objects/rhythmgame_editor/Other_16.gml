if (rem_pos == 0)
    exit;
audio_sound_set_track_position(track1_instance, rem_pos);
audio_sound_set_track_position(track2_instance, rem_pos);
trackpos = rem_pos;
scroll_init = 1;
