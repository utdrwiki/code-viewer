function scr_cutscene_save_objects()
{
    if (scr_debug())
    {
        with (obj_cutscene_master)
        {
            var _startslot = 0;
            for (var i = 0; i < 10; i++)
            {
                if (save_object[i] == 99999999 || save_object[i] == -4 || is_undefined(save_object[i]))
                {
                    show_debug_message("we breakin out of here");
                    break;
                }
                else
                {
                    _startslot++;
                }
            }
            for (var i = 0; i < argument_count; i++)
            {
                if ((_startslot + i) >= 10)
                {
                    scr_debug_print("Cutscene object limit reached.");
                    break;
                }
                else
                {
                    save_object[_startslot + i] = argument[i];
                }
            }
        }
    }
}

function scr_cutscene_save_song(arg0 = false)
{
    with (obj_cutscene_master)
    {
        save_mus = true;
        if (arg0)
        {
            if (v_ex("save_mus_pos") && save_mus_pos >= 0)
                exit;
            else
                save_mus_pos = 0;
        }
        else
        {
            save_mus_pos = -1;
        }
    }
}

function scr_cutscene_save_music()
{
    if (!v_ex("save_mus") || save_mus == false)
        exit;
    if (global.currentsong[1] == -4)
    {
        save_mus_track = -4;
        save_mus_playing = false;
        save_mus_vol = 1;
        save_mus_pitch = 1;
        save_mus_pos = -1;
    }
    else
    {
        save_mus_track = global.currentsong[0];
        save_mus_playing = snd_is_playing(global.currentsong[1]);
        save_mus_pitch = audio_sound_get_pitch(global.currentsong[1]);
        save_mus_vol = audio_sound_get_gain(global.currentsong[1]);
        if (v_ex("save_mus_pos") && save_mus_pos >= 0)
            save_mus_pos = audio_sound_get_track_position(global.currentsong[1]);
        else
            save_mus_pos = -1;
    }
}

function scr_cutscene_load_music()
{
    if (!v_ex("save_mus") || save_mus == false)
        exit;
    if (global.currentsong[0] != save_mus_track)
    {
        if (global.currentsong[0] != -4)
            snd_stop(global.currentsong[1]);
        if (save_mus_track != -4)
        {
            global.currentsong[0] = snd_init(save_mus_track);
            global.currentsong[1] = mus_loop(global.currentsong[1]);
        }
        else
        {
            global.currentsong[0] = -4;
            global.currentsong[1] = -4;
        }
    }
    if (save_mus_track != -4)
    {
        snd_pitch(global.currentsong[1], save_mus_pitch);
        snd_volume(global.currentsong[1], save_mus_vol, 0);
        if (save_mus_pos >= 0)
            audio_sound_set_track_position(global.currentsong[1], save_mus_pos);
        if (snd_is_playing(global.currentsong[1]) != save_mus_playing)
        {
            if (save_mus_playing)
                audio_resume_sound(global.cuurrentsong[1]);
            else
                snd_pause(global.currentsong[1]);
        }
    }
}
