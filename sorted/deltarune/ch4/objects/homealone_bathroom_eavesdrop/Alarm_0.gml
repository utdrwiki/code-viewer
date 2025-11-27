if (!stop_speech)
{
    current_index++;
    if (current_index > (array_length_1d(speech) - 1))
        stop_speech = true;
}
