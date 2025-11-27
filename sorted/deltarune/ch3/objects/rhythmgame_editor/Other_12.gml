paused = !paused;
if (paused)
{
    audio_pause_sound(track1_instance);
    audio_pause_sound(track2_instance);
    if (rem_mode)
        event_user(6);
    scroll_init = 1;
}
else
{
    audio_resume_sound(track1_instance);
    audio_resume_sound(track2_instance);
    with (obj_rhythmgame_editor_note_node)
        instance_destroy();
    if (instrument == 0)
    {
        if (oneAtATime)
            mus_volume(track1_instance, 0, 0);
        mus_volume(track2_instance, 1, 0);
    }
}
