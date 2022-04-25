scr_music_mute = function() //gml_Script_scr_music_mute
{
    if (scr_debug() && keyboard_check_pressed(ord("M")) && audio_is_playing(global.batmusic[1]))
    {
        if (!audio_is_paused(global.batmusic[1]))
            audio_pause_sound(global.batmusic[1])
        else
            audio_resume_sound(global.batmusic[1])
    }
    return;
}

