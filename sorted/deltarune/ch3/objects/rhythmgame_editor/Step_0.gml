if (song_menu)
{
    if (start_buffer)
    {
        start_buffer = false;
        exit;
    }
    if (up_p())
    {
        if (selection > 0)
            selection--;
        snd_play(snd_menumove);
    }
    if (down_p())
    {
        if (selection < array_length(tracklist))
            selection++;
        snd_play(snd_menumove);
    }
    if (left_p())
    {
        if (instrument == 0)
            instrument = 1;
        else if (instrument == 2)
            instrument = 0;
        snd_play(snd_menumove);
    }
    if (right_p())
    {
        if (instrument == 0)
            instrument = 2;
        else if (instrument == 1)
            instrument = 0;
        snd_play(snd_menumove);
    }
    if (button1_p())
    {
        if (global.chapter == 3)
            song_id = selection;
        else
            scr_rhythmgame_song_select(selection);
        load_chart();
        song_menu = false;
    }
    exit;
}
if (scroll_init > 0)
{
    if (scroll_init < 5)
    {
        scroll_init++;
    }
    else
    {
        scr_rhythmgame_editor_note_refresh();
        do_refresh = true;
        scroll_init = 0;
    }
}
if (loadsong == 1)
{
    track1 = snd_init(track1_id);
    track2 = snd_init(track2_id);
    loadsong = 2;
    playtimer = 0;
}
if (loadsong == 2)
{
    playtimer++;
    if (playtimer == 4)
    {
        track1_instance = mus_loop(track1);
        track2_instance = mus_loop(track2);
    }
    if (playtimer == 5)
    {
        if (trackstart > 0)
        {
            audio_sound_set_track_position(track1_instance, trackstart);
            audio_sound_set_track_position(track2_instance, trackstart);
        }
        if (oneAtATime)
            mus_volume(track1_instance, 0, 0);
        if (song_id == 2)
            mus_volume(track1_instance, 0.75, 0);
        loadsong = 3;
        song_initialized = 1;
    }
}
if (song_initialized == 1)
{
    if (scr_debug())
    {
        if (keyboard_check_pressed(ord("T")))
            scroll_init = 1;
        if (keyboard_check_pressed(ord("P")) || keyboard_check_pressed(vk_space))
            event_user(2);
    }
    if (!paused || scrollcon < 2)
        trackpos = audio_sound_get_track_position(track1_instance);
    if (song_id == 4)
    {
        var _pitch = remap_clamped(4, 7.25, 1, 0.05, trackpos);
        audio_sound_pitch(track1_instance, _pitch);
        audio_sound_pitch(track2_instance, _pitch);
    }
    var timeunit = trackpos - remtrackpos[0];
    var averagetimeunit = ((trackpos - remtrackpos[0]) + (remtrackpos[0] - remtrackpos[1]) + (remtrackpos[1] - remtrackpos[2])) / 3;
    remtrackpos[4] = remtrackpos[3];
    remtrackpos[3] = remtrackpos[2];
    remtrackpos[2] = remtrackpos[1];
    remtrackpos[1] = remtrackpos[0];
    remtrackpos[0] = trackpos;
    var notecheckmax = -1;
    var notecheck = minnote;
    var foundnotes = 0;
    while (notecheck < maxnote)
    {
        notecheckmax++;
        if (abs(notetime[notecheck] - trackpos) < 0.12)
        {
            foundnotes = 1;
            targetnote[notecheckmax] = notecheck;
            notecheck++;
        }
        else
        {
            notecheckmax--;
            break;
        }
    }
    pressedtimer[0]++;
    pressedtimer[1]++;
    buffer[0]--;
    buffer[1]--;
    hold_score = 0;
    var _loop_end = (instrument > 0) ? 3 : 2;
    for (i = 0; i < _loop_end; i++)
    {
        var checkpress, holdpress;
        if (paused)
        {
            checkpress = 0;
            holdpress = 0;
        }
        else if (i == 0)
        {
            checkpress = button1_p();
            if (checkpress)
            {
                kris.sprite_index = spr_kris_guitar;
                with (kris)
                {
                    sprite_index = spr_kris_guitar;
                    event_user(0);
                }
            }
            holdpress = button1_h() || auto_play;
        }
        else if (i == 1)
        {
            checkpress = button2_p();
            if (checkpress)
            {
                with (kris)
                {
                    sprite_index = spr_kris_guitar_high;
                    event_user(0);
                }
            }
            holdpress = button2_h() || auto_play;
        }
        else if (i == 2)
        {
            checkpress = button3_p();
            if (checkpress)
            {
                with (kris)
                {
                    sprite_index = spr_kris_guitar_high_hold;
                    event_user(0);
                }
            }
            holdpress = button3_h() || auto_play;
        }
        if (recording_mode && checkpress)
        {
            rec_time[rec_count] = trackpos;
            rec_endtime[rec_count] = trackpos;
            rec_type[rec_count] = i;
            rec_count++;
        }
        if (hold_end[i] > 0)
        {
            if (hold_end[i] < trackpos || !holdpress)
            {
                if (trackpos >= hold_start[i])
                {
                    var chainPoints = (floor(((min(hold_end[i], trackpos) - hold_start[i]) / meter) * 40) * 10) + 50;
                    total_score += chainPoints;
                    score_scale = 4;
                    combo += chainPoints;
                    if (instrument == 2)
                    {
                        note_hit_timer[0] = 0;
                        note_hit_timer[1] = 0;
                        note_hit_timer[2] = 0;
                        note_hit_timer[i] = 5;
                    }
                    else
                    {
                        note_hit_timer[i] = 4;
                    }
                }
                hold_end[i] = 0;
            }
            else if (trackpos >= hold_start[i])
            {
                hold_score += floor(((trackpos - hold_start[i]) / meter) * 400);
                if (score_scale < 2.5)
                    score_scale += 0.4;
                if (instrument == 2)
                {
                    if (note_hit_timer[0] == 1)
                        note_hit_timer[0] = 3;
                }
                else if (note_hit_timer[i] <= 1)
                {
                    note_hit_timer[i] = 3;
                }
            }
        }
        if (checkpress && buffer[i] <= 0)
        {
            if (instrument == 2)
            {
                note_hit_timer[0] = 0;
                note_hit_timer[1] = 0;
                note_hit_timer[2] = 0;
                note_hit_timer[i] = 5;
            }
            else
            {
                note_hit_timer[i] = 5;
            }
            pressedtimer[i] = 0;
            buffer[i] = 2;
        }
        if ((pressedtimer[i] < (room_speed / 10) || auto_play) && foundnotes == 1)
        {
            for (var notei = 0; notei <= notecheckmax; notei++)
            {
                if (notetype[targetnote[notei]] == i && notealive[targetnote[notei]] == 1)
                {
                    var leniency = 1.6;
                    if (auto_play)
                    {
                        if (notetime[targetnote[notei]] <= (trackpos + averagetimeunit))
                            notescore[targetnote[notei]] = 100;
                        else
                            break;
                    }
                    else if (abs(notetime[targetnote[notei]] - trackpos) < (averagetimeunit * leniency))
                    {
                        notescore[targetnote[notei]] = 100;
                    }
                    else if (abs(notetime[targetnote[notei]] - trackpos) < (averagetimeunit * leniency * 1.5))
                    {
                        notescore[targetnote[notei]] = 60;
                    }
                    else
                    {
                        notescore[targetnote[notei]] = 40;
                    }
                    total_score += notescore[targetnote[notei]];
                    combo += notescore[targetnote[notei]];
                    score_scale = min(4, score_scale + (notescore[targetnote[notei]] / 100));
                    if (notescore[targetnote[notei]] > 0)
                    {
                        if (auto_play)
                        {
                            if (instrument == 2)
                            {
                                note_hit_timer[0] = 0;
                                note_hit_timer[1] = 0;
                                note_hit_timer[2] = 0;
                                note_hit_timer[i] = 5;
                            }
                            else
                            {
                                note_hit_timer[i] = 5;
                            }
                        }
                        note_streak++;
                    }
                    if (noteanim[targetnote[notei]] > 0)
                    {
                        if (instrument == 0)
                        {
                            if (i == 1)
                                kris.sprite_index = spr_kris_guitar_high_hold;
                            else
                                kris.sprite_index = spr_kris_guitar_high;
                        }
                    }
                    if (notescore[targetnote[notei]] >= 40 && noteend[targetnote[notei]] > 0)
                    {
                        hold_start[i] = notetime[targetnote[notei]];
                        hold_end[i] = noteend[targetnote[notei]];
                    }
                    notealive[targetnote[notei]] = 0;
                    if (notescore[targetnote[notei]] != 100)
                        snd_play(snd_swing);
                    pressedtimer[i] = (room_speed / 10) + 1;
                    if (instrument == 0)
                    {
                        if (oneAtATime)
                            mus_volume(track1_instance, 0, 0);
                        mus_volume(track2_instance, 1, 0);
                    }
                }
            }
        }
    }
    if (keyboard_check(vk_lcontrol))
    {
        if (keyboard_check_pressed(ord("Z")))
        {
            if (keyboard_check(vk_lshift))
                scr_rhythmgame_editor_redo();
            else
                scr_rhythmgame_editor_undo();
        }
        else if (keyboard_check_pressed(ord("Y")))
        {
            scr_rhythmgame_editor_redo();
        }
        else if (keyboard_check_pressed(ord("C")))
        {
            scr_rhythmgame_editor_copy(keyboard_check(vk_lshift) ? (meter * 2) : meter);
        }
        else if (keyboard_check_pressed(ord("V")))
        {
            scr_rhythmgame_editor_paste();
        }
    }
    if (savecon == 0 && keyboard_check_pressed(ord("U")))
    {
        if (!paused)
            event_user(2);
        savecon = 1;
    }
    else if (savecon == 0 && keyboard_check_pressed(ord("I")))
    {
        if (!paused)
            event_user(2);
        savecon = -1;
    }
    else if (savecon == 1)
    {
        if (keyboard_check_pressed(ord("Z")))
        {
            event_user(0);
            savecon = 2;
            load_source = 1;
        }
        else if (keyboard_check_pressed(ord("X")))
        {
            savecon = 0;
        }
    }
    else if (savecon == -1)
    {
        if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("1")))
        {
            scr_rhythmgame_editor_load(savestring + ".txt");
        }
        else if (keyboard_check_pressed(ord("2")))
        {
            scr_rhythmgame_editor_load(savestring + "_autosave.txt");
        }
        else if (keyboard_check_pressed(ord("3")))
        {
            scr_rhythmgame_clear_notes();
            if (instrument == 0)
            {
                scr_rhythmgame_notechart_lead(song_id);
                if (song_id == 0)
                {
                    scr_rhythmgame_notechart_lead_solo(0);
                    scr_rhythmgame_notechart_lead_solo(1);
                    scr_rhythmgame_notechart_lead_solo(2);
                    scr_rhythmgame_notechart_lead_finale();
                }
            }
            else if (instrument == 1)
            {
                scr_rhythmgame_notechart_drums(song_id);
            }
            else if (instrument == 2)
            {
                scr_rhythmgame_notechart_vocals(song_id);
            }
            if (savecon == -1)
                savecon = -2;
            load_source = 2;
        }
        else if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(ord("4")))
        {
            savecon = 0;
        }
    }
    else if (abs(savecon) == 2)
    {
        if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("X")))
            savecon = 0;
    }
    if (!keyboard_check(vk_lcontrol) && keyboard_check_pressed(ord("V")))
    {
        rem_pos = trackpos;
        rem_mode = true;
    }
    if (rem_pos != 0 && keyboard_check_pressed(ord("B")))
        rem_mode = !rem_mode;
    if (keyboard_check_pressed(ord("Q")))
    {
        auto_play = !auto_play;
        if (auto_play)
            scr_debug_print("autoplay enabled");
        else
            scr_debug_print("autoplay disabled");
    }
    if (rem_pos != 0 && keyboard_check_pressed(ord("N")))
        event_user(6);
    if (keyboard_check_pressed(ord("W")))
    {
        if (oneAtATime)
            mus_volume(track1_instance, 1, 0);
        mus_volume(track2_instance, 0, 0);
        debug_print("Guitar muted");
    }
    if (keyboard_check_pressed(ord("E")))
    {
        if (oneAtATime)
            mus_volume(track1_instance, 0, 0);
        mus_volume(track2_instance, 1, 0);
        debug_print("Guitar unmuted");
    }
    if (keyboard_check_pressed(vk_tab))
        tooltips = !tooltips;
    if (keyboard_check_pressed(189))
    {
        if (notespeed > 30)
            notespeed -= 15;
    }
    if (keyboard_check_pressed(187))
    {
        if (notespeed < 300)
            notespeed += 15;
    }
    if (keyboard_check(ord("0")))
        notespeed = original_notespeed;
    var _playhead_x = (camerax() + 640) - 20;
    var _playhead_y = lerp((cameray() + 480) - 20, cameray() + 20, trackpos / track_length);
    var _playhead_hover = mouse_x >= (_playhead_x - 10) && mouse_y >= (_playhead_y - 10) && mouse_x <= (_playhead_x + 10) && mouse_y <= (_playhead_y + 10);
    if (_playhead_hover && scrollcon < 2)
    {
        if (mouse_button == mb_none)
            scrollcon = 1;
        else if (scrollcon == 1 && mouse_button == mb_left)
            scrollcon = 2;
    }
    else if (scrollcon == 1)
    {
        scrollcon = 0;
    }
    if (scrollcon == 2)
    {
        if (!paused)
            event_user(2);
        trackpos = remap_clamped((cameray() + 480) - 20, cameray() + 20, 0, track_length, mouse_y);
        if (mouse_button == mb_none)
        {
            audio_sound_set_track_position(track1_instance, trackpos);
            audio_sound_set_track_position(track2_instance, trackpos);
            scrollcon = _playhead_hover ? 1 : 0;
            scr_rhythmgame_editor_note_refresh();
        }
        else if (mouse_button == mb_right)
        {
            trackpos = audio_sound_get_track_position(track1_instance);
            scrollcon = _playhead_hover ? 1 : 0;
            scr_rhythmgame_editor_note_refresh();
        }
    }
    if (scrollcon < 2)
    {
        var _timechange = 0;
        if (keyboard_check(vk_up))
            _timechange += 0.03125;
        if (keyboard_check(vk_down))
            _timechange -= 0.03125;
        if (_timechange != 0)
        {
            arrow_scroll = true;
            if (keyboard_check(vk_lshift))
            {
                if (quickscroll_timer > 60)
                    _timechange *= 4;
                else
                    _timechange *= ((quickscroll_timer > 30) ? 3 : 2);
                quickscroll_timer++;
            }
            else if (keyboard_check(vk_lalt))
            {
                _timechange *= 0.5;
            }
            trackpos += _timechange;
            audio_sound_set_track_position(track1_instance, trackpos);
            audio_sound_set_track_position(track2_instance, trackpos);
        }
        else if (arrow_scroll)
        {
            arrow_scroll = false;
            scroll_init = 1;
            quickscroll_timer = 0;
        }
    }
}
