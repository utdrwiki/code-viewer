if (current_text != cutoff_text)
{
    current_index = clamp(current_index + 1, 0, array_length_1d(speech) - 1);
    current_text = !stop_speech ? speech[current_index] : cutoff_text;
    alarm[0] = speech_time * 0.25;
}
else
{
    instance_destroy();
}
