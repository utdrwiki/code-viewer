event_user(15);
debug_message("cleanup state run");
if (audio_exists(fuzzsnd))
    snd_stop(fuzzsnd);
