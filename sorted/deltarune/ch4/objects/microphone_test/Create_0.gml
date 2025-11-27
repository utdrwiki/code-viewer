global.mic_sensitivity = 0.5;
global.microphone = 0;
global.use_mic = 1;
if (audio_get_recorder_count() == 0)
{
    if (scr_debug())
        scr_debug_print("No Microphone!");
    exit;
}
mic_max = audio_get_recorder_count() + 1;
for (i = 0; i < mic_max; i++)
    mic_name[i] = audio_get_recorder_info(i);
audio_record = audio_start_recording(0);
audio_buffer = buffer_create(9600, buffer_fixed, 2);
drawing = true;
microphone_volume = 0;
microphone_volume2 = 0;
us_old = -1;
current = 0;
if (drawing)
    graph = ds_list_create();
