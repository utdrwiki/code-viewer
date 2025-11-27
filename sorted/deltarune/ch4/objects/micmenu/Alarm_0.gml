obj_mike_controller.microphone_volume = 0;
microphone_volume = 0;
if (current < (mic_max - 1))
{
    global.microphone = current;
    with (obj_mike_controller)
        mic_reset();
}
