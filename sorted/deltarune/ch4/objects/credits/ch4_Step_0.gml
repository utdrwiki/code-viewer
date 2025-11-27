if (!loaded)
    exit;
if (scr_debug())
{
    if (sunkus_kb_check_pressed(82))
    {
        snd_free_all();
        room_restart();
    }
    if (sunkus_kb_check_pressed(81))
        audio_sound_set_track_position(song1, audio_sound_get_track_position(song1) + measure_time);
    if (sunkus_kb_check_pressed(32))
    {
        if (!paused)
        {
            paused = true;
            audio_pause_all();
        }
        else
        {
            paused = false;
            audio_resume_all();
        }
    }
}
if (!init)
{
    init = true;
    snd_free_all();
    song0 = snd_init("ch4_credits.ogg");
    song1 = mus_play(song0);
}
if (credits_con == 0)
{
    if (credit_index < (array_length(credits) - 1))
    {
        if (audio_is_playing(song1))
        {
            var track_progress = audio_sound_get_track_position(song1);
            if (track_progress < measure_timer)
                exit;
            var measure_progress = track_progress / measure_time;
            credit_index = floor(measure_progress) - 1;
        }
    }
    else
    {
        credits_con = 1;
        glowing_active = true;
    }
}
if (credits_con == 1)
{
    var track_progress = audio_sound_get_track_position(song1);
    if (track_progress >= 59.75)
    {
        creditalpha = 0;
        credits_con = -1;
    }
}
if (glowing_active)
{
    if (con == 0)
    {
        con = 1;
        auto_text = true;
    }
    if (con == 50 && !i_ex(obj_writer))
    {
        con = 51;
        scr_delay_var("con", 52, 90);
    }
    if (con == 52 && !i_ex(obj_writer))
    {
        con = 53;
        scr_delay_var("con", 54, 180);
        credit_index++;
        creditalpha = 1;
        scr_lerpvar("year_alpha", -1, 1, 120);
    }
    if (con == 54 && !i_ex(obj_writer))
    {
        if (audio_is_playing(song1))
        {
            var track_progress = audio_sound_get_track_position(song1);
            var measure_progress = track_progress / measure_time;
            var current_measure = floor(measure_progress);
            if (current_measure == 26)
            {
                con = 59;
                scr_delay_var("con", 60, 60);
                creditalpha = 0;
            }
        }
        else
        {
            con = 59;
            scr_delay_var("con", 60, 60);
            creditalpha = 0;
        }
    }
    if (con == 60)
    {
        con = -1;
        game_restart();
    }
    if (auto_text)
    {
        if (audio_is_playing(song1))
        {
            var track_progress = audio_sound_get_track_position(song1);
            if (track_progress >= auto_text_start)
            {
                if (!i_ex(obj_writer))
                {
                    if (glowing_index < array_length(glowing_text))
                    {
                        dequeue_text();
                    }
                    else
                    {
                        auto_text = false;
                        con = 50;
                    }
                }
            }
            if (track_progress >= auto_text_stop)
            {
                with (obj_writer)
                    forcebutton1 = 1;
            }
            with (obj_writer)
                skippable = 0;
        }
    }
}
