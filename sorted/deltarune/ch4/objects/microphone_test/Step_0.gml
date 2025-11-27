if (scr_debug())
{
    if (keyboard_check(vk_right))
        global.mic_sensitivity = scr_approach(global.mic_sensitivity, 1, 0.05);
    if (keyboard_check(vk_left))
        global.mic_sensitivity = scr_approach(global.mic_sensitivity, 0, 0.05);
    if (up_p())
    {
        current -= 1;
        if (current < 0)
            current = mic_max - 1;
        audio_stop_recording(audio_record);
        buffer_delete(audio_buffer);
        if (current < mic_max)
        {
            audio_record = audio_start_recording(current);
            audio_buffer = buffer_create(9600, buffer_fixed, 2);
        }
    }
    if (down_p())
    {
        current += 1;
        if (current == mic_max)
            current = 0;
        audio_stop_recording(audio_record);
        buffer_delete(audio_buffer);
        if (current < mic_max)
        {
            audio_record = audio_start_recording(current);
            audio_buffer = buffer_create(9600, buffer_fixed, 2);
        }
    }
    if (keyboard_check_pressed(vk_enter) || button1_p())
    {
        global.microphone = current;
        if (current == (mic_max - 1))
            global.use_mic = false;
        room_goto_next();
    }
}
