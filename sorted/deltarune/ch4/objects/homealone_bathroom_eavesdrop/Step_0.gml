if (start_speech)
{
    start_speech = false;
    current_text = speech[current_index];
    dhaver = 1;
    alarm[0] = speech_time * 2;
}
if (stop_speech)
{
    speech_alpha = scr_movetowards(speech_alpha, 0, 0.2);
    if (speech_alpha <= 0)
    {
        stop_speech = false;
        instance_destroy();
        exit;
    }
}
