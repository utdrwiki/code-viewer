if (wave_time > 0)
{
    hue = scr_wave(hue_start, hue_target, wave_time, 0);
    sat = scr_wave(sat_start, sat_target, wave_time, 0);
    val = scr_wave(val_start, val_target, wave_time, 0);
}
if (heartbeat_mode)
{
    var _percent = audio_sound_get_track_position(global.currentsong[1]) / audio_sound_length(global.currentsong[1]);
    hue = lerp(hue_start, hue_target, abs(sin(_percent * pi)));
    sat = lerp(sat_start, sat_target, abs(sin(_percent * pi)));
    val = lerp(val_start, val_target, abs(sin(_percent * pi)));
}
