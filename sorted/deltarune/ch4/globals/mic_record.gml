function scr_mic_record()
{
    len = ds_map_find_value(async_load, "data_len");
    buffer_seek(audio_buffer, buffer_seek_start, 0);
    buffer_copy(ds_map_find_value(async_load, "buffer_id"), 0, len, audio_buffer, 0);
    var alpha = 0.003;
    for (var i = 0; i < (len / 16); i++)
    {
        var us = buffer_read(audio_buffer, buffer_s16);
        us = abs(us);
        if (us_old == -1)
            us_old = us;
        us = (alpha * us) + ((1 - alpha) * us_old);
        us_old = us;
        if (!variable_global_exists("mic_sensitivity"))
            global.mic_sensitivity = 0.5;
        microphone_volume = clamp(us * max(0.01, global.mic_sensitivity) * 0.05, 0, 100);
        with (obj_mike_minigame_controller)
        {
            if (inv_mic)
                other.microphone_volume = 101 - other.microphone_volume;
        }
    }
}

function mic_reset()
{
    if (global.use_mic)
    {
        if (audio_record != -4)
        {
            audio_stop_recording(audio_record);
            buffer_delete(audio_buffer);
        }
        audio_record = audio_start_recording(global.microphone);
        audio_buffer = buffer_create(9600, buffer_fixed, 2);
    }
}
