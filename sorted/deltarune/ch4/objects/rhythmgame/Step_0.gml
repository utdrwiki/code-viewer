if (!hide_heroes)
{
    with (obj_mainchara)
        visible = 0;
    with (obj_caterpillarchara)
        visible = 0;
    hide_heroes = true;
}
if (freeplay < 0)
{
    if (up_p() && song_id > 0)
    {
        song_id--;
        snd_play(snd_menumove);
    }
    if (down_p() && song_id < (array_length(tracklist) - 1))
    {
        song_id++;
        snd_play(snd_menumove);
    }
    if (right_p() && !hardmode)
    {
        hardmode = true;
        snd_play(snd_menumove);
    }
    if (left_p() && hardmode)
    {
        hardmode = false;
        snd_play(snd_menumove);
    }
    if (button1_p())
    {
        freeplay = 0;
        bg_con = 1;
        effects.con = 2;
        with (obj_rhythmgame_spotlight_solo)
            con = 2;
        event_user(0);
        exit;
    }
    else
    {
        exit;
    }
}
if (freeplay == 2)
{
    freeplay = 1;
    bg_con = 1;
    effects.con = 2;
    with (obj_rhythmgame_spotlight_solo)
        con = 2;
    event_user(0);
}
if (tutorial == -1)
{
    fade = scr_movetowards(fade, 1, 0.05);
    with (obj_rhythmgame_chart)
        fade = scr_movetowards(fade, 1, 0.05);
    fame = scr_movetowards(fame, 6000, 300);
    if (fame == 6000 && fade == 1)
        tutorial = 0;
}
if (tutorial != 1 && tutorial != 2)
{
    if (tenna_boss && i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity == true)
    {
        chart_lerp = scr_movetowards(chart_lerp, show_chart, 0.2);
        chart_ease = scr_ease_out(chart_lerp, 2);
    }
    else
    {
        chart_lerp = scr_movetowards(chart_lerp, show_chart, 0.05);
        chart_ease = scr_ease_out(chart_lerp, 2);
    }
}
if (tutorial > 0)
{
    kchart_lerp = scr_movetowards(kchart_lerp, show_chart, 0.05);
    kchart_ease = scr_ease_out(kchart_lerp, 2);
}
else
{
    kchart_lerp = chart_lerp;
    kchart_ease = chart_ease;
}
if (scr_debug())
{
    if (keyboard_check_pressed(ord("U")))
        event_user(4);
    if (keyboard_check_pressed(ord("I")) || (show_debug && (gamepad_button_check_pressed(0, gp_face3) || gamepad_button_check_pressed(1, gp_face3))))
    {
        if (tutorial > 0)
        {
            debug_print("Can not alter autoplay during tutorial");
        }
        else if (auto_play == 0)
        {
            auto_play = 1;
            debug_print("Autoplay enabled.");
        }
        else if (auto_play == 1)
        {
            auto_play = 0;
            debug_print("Autoplay disabled.");
        }
    }
    if (keyboard_check_pressed(ord("O")) || (show_debug && (gamepad_button_check_pressed(0, gp_select) || gamepad_button_check_pressed(1, gp_select))))
    {
        show_debug = !show_debug;
        if (show_debug)
            debug_print("debug mode enabled");
        else
            debug_print("debug mode disabled");
    }
    if (song_id == 0 && solo_con == 0)
    {
        if (keyboard_check_pressed(ord("1")))
        {
            solo_difficulty = 0;
            scr_debug_print("Solo difficulty set to easy.");
        }
        else if (keyboard_check_pressed(ord("2")))
        {
            solo_difficulty = 1;
            scr_debug_print("Solo difficulty set to medium.");
        }
        else if (keyboard_check_pressed(ord("3")))
        {
            solo_difficulty = 2;
            scr_debug_print("Solo difficulty set to hard.");
        }
        else if (keyboard_check_pressed(ord("4")))
        {
            solo_difficulty = -1;
            scr_debug_print("Solo difficulty set to auto.");
        }
    }
    var _vol = main_vol;
    if (sunkus_kb_check_pressed_with_repeat(189))
        _vol -= (keyboard_check(vk_lshift) ? 0.5 : 0.1);
    if (sunkus_kb_check_pressed_with_repeat(187))
        _vol += (keyboard_check(vk_lshift) ? 0.5 : 0.1);
    if (_vol != main_vol)
    {
        main_vol = clamp01(_vol);
        mus_volume(track1_instance, main_vol, 0);
        if (oneAtATime)
            mus_volume(track2_instance, 0, 0);
        else
            mus_volume(track2_instance, main_vol, 0);
        debug_print("Song volume set to " + string(main_vol * 100) + "%");
    }
}
if (song_id == 4)
{
    if (scr_debug() && intro_con == 1 && keyboard_check_pressed(ord("4")))
        intro_con = 2;
}
if (init == 0)
{
    if (other.song_id == 4)
    {
        drums.performer.visible = false;
        vocals.performer.visible = false;
    }
    if (tenna_boss)
    {
        freeplay = false;
        replayversion = false;
        if (audio_is_playing(global.batmusic[1]))
        {
            trackstart = audio_sound_get_track_position(global.batmusic[1]);
        }
        else
        {
            debug_print("track start randomized");
            trackstart = random(82.5);
        }
        bpm = 148;
        notespacing = 60 / bpm;
        meter = notespacing * 4;
        chart_start = scr_ceil_to_beat(trackstart + (boss_delay / 30), bpm, 0.5);
        chart_end = trackstart + floor_to_multiple((turn_length - 30) / 30, meter / 2);
        song_id = 2;
        loadsong = 1;
        difficulty = 1;
        performer.sprite_index = spr_kris_guitar_ready;
        loop = true;
        with (obj_rhythmgame_chart)
        {
            target_brightness = 0.75;
            if (other.speed_modifier > 2)
                brightness = 0.75;
            auto_play = true;
            if (instrument == 1)
            {
                performer.sprite_index = spr_susie_drum_ready;
                performer.image_speed = 0.5;
            }
            else if (instrument == 2)
            {
                performer.sprite_index = spr_ralsei_sing_polite_closed;
            }
        }
        event_user(0);
    }
    init = 1;
}
if (song_id >= 0 && song_loaded == false && loadsong >= 1)
{
    scr_rhythmgame_load_song(song_id, true, true);
    scr_debug_print("Song Loaded");
    if (tenna_boss)
    {
        fame_mul = 80 / maxnote;
        if (speed_modifier <= 2)
            button_alpha = 5;
    }
    notespeed *= speed_modifier;
    notespeed = round_to_multiple(notespeed, 30);
    song_loaded = true;
}
if (tenna_boss && keyboard_check_pressed(ord("V")))
{
    auto_play = true;
    song_done = true;
}
if (intro_con == -1)
    exit;
if (intro_con < 2)
    exit;
if (init == 1)
{
    if (tenna_boss)
    {
        loadsong = 3;
        scr_debug_print("loaded tenna info");
        var _forceload = false;
        if (!audio_is_playing(global.batmusic[1]))
        {
            global.batmusic[0] = snd_init(track1_id);
            global.batmusic[1] = mus_loop(global.batmusic[0]);
            audio_sound_set_track_position(global.batmusic[1], trackstart);
            _forceload = true;
        }
        track1 = global.batmusic[0];
        track1_instance = global.batmusic[1];
        if (array_length(global.batmusic) <= 2 || _forceload)
        {
            scr_debug_print("failsafe triggered! second stem wasn't preloaded!!!");
            global.batmusic[2] = snd_init(track2_id);
            global.batmusic[3] = mus_loop(global.batmusic[2]);
            audio_sound_set_track_position(global.batmusic[3], trackstart);
        }
        track2 = global.batmusic[2];
        track2_instance = global.batmusic[3];
        track1_main = track1_instance;
        track2_main = track2_instance;
        musicm.loop = true;
        mus_volume(track1_instance, main_vol * 0.9, 60);
        mus_volume(track2_instance, 0, 0);
        song_initialized = 1;
        if (v_ex("musicm"))
            musicm.track1_instance = track1_main;
    }
    init = 2;
}
else if (tenna_boss && init == 2)
{
    audio_sound_set_track_position(track2_instance, trackpos);
    init = 3;
}
if (loadsong == 1)
{
    if (tutorial >= 1 && audio_is_playing(global.currentsong[1]))
    {
        track1 = global.currentsong[0];
        track2 = snd_init(track2_id);
        trackstart = audio_sound_get_track_position(global.currentsong[1]);
        trackpos = trackstart;
    }
    else
    {
        track1 = snd_init(track1_id);
        track2 = snd_init(track2_id);
    }
    if (song_id == 0)
    {
        track1_solo = snd_init(track1_id);
        track2_solo = snd_init(track2_id);
    }
    loadsong = 2;
    playtimer = 0;
}
if (loadsong == 2)
{
    if (trackstart >= 0 || playtimer != 3)
        playtimer++;
    if (playtimer == 3 && trackstart < 0)
    {
        trackstart += ((delta_time / 1000000) * pitch);
        trackpos = trackstart;
        scr_debug_print_persistent("countdown", "countdown: " + string(trackstart));
        if (trackstart >= 0)
        {
            scr_debug_delete_persistent("countdown");
            trackstart = 0;
            trackpos = 0;
            playtimer = 4;
        }
    }
    if (playtimer == 4)
    {
        if (loop)
        {
            if (tutorial >= 1 && audio_is_playing(global.currentsong[1]))
            {
                track1_instance = global.currentsong[1];
                track2_instance = mus_loop(track2);
            }
            else
            {
                track1_instance = mus_loop(track1);
                track2_instance = mus_loop(track2);
            }
        }
        else
        {
            track1_instance = mus_play(track1);
            track2_instance = mus_play(track2);
            if (trackstart < 0)
            {
                snd_pause(track1_instance);
                snd_pause(track2_instance);
            }
        }
        if (song_id == 0)
        {
            track1_solo_instance = mus_play(track1_solo);
            track2_solo_instance = mus_play(track2_solo);
            if (trackstart < 0)
            {
                audio_pause_sound(track1_solo_instance);
                audio_pause_sound(track2_solo_instance);
            }
        }
        if (tutorial == 1)
        {
            mus_volume(track1_instance, main_vol, 0);
            mus_volume(track2_instance, 0, 0);
        }
        track1_main = track1_instance;
        track2_main = track2_instance;
    }
    if (playtimer == 5)
    {
        if (trackstart > 0)
        {
            if (tutorial > 0)
            {
                trackpos = audio_sound_get_track_position(track1_instance);
                audio_sound_set_track_position(track2_instance, trackpos);
            }
            else
            {
                audio_sound_set_track_position(track1_instance, trackstart);
                audio_sound_set_track_position(track2_instance, trackstart);
            }
            if (song_id == 0)
            {
                audio_sound_set_track_position(track1_solo_instance, trackstart);
                audio_sound_set_track_position(track2_solo_instance, trackstart);
            }
        }
        if (tutorial > 0)
        {
            mus_volume(track1_instance, main_vol, 0);
            mus_volume(track2_instance, 0, 0);
        }
        else if (!oneAtATime)
        {
            mus_volume(track1_instance, main_vol, 0);
            mus_volume(track2_instance, main_vol, 0);
        }
        else
        {
            mus_volume(track1_instance, 0, 0);
            mus_volume(track2_instance, main_vol, 0);
        }
        loadsong = 3;
        song_initialized = 1;
        if (song_id == 0)
        {
            mus_volume(track1_solo_instance, 0, 0);
            mus_volume(track2_solo_instance, 0, 0);
            if (!freeplay)
            {
                var _failures = global.flag[1096];
                if (_failures == 3)
                    difficulty = 3;
                else if (_failures == 4)
                    difficulty = 2;
                else if (_failures >= 5)
                    difficulty = 1;
            }
        }
        if (v_ex("musicm"))
            musicm.track1_instance = track1_main;
    }
}
if (song_initialized == 1 || (trackpos < 0 && playtimer == 3))
{
    if (scr_debug() && song_initialized == 1)
    {
        if (keyboard_check_pressed(ord("P")) || (show_debug && (gamepad_button_check_pressed(0, gp_start) || gamepad_button_check_pressed(1, gp_start))))
        {
            paused = !paused;
            if (paused)
            {
                audio_pause_sound(track1_main);
                audio_pause_sound(track2_main);
                if (song_id == 0)
                {
                    audio_pause_sound(track1_solo);
                    audio_pause_sound(track2_solo);
                }
            }
            else
            {
                audio_resume_sound(track1_main);
                audio_resume_sound(track2_main);
                if (song_id == 0)
                {
                    audio_resume_sound(track1_solo);
                    audio_resume_sound(track2_solo);
                }
            }
        }
    }
    var _truetrackpos = 0;
    if (trackstart < 0)
    {
        trackpos = trackstart;
    }
    else
    {
        if (lose_con == 0 && !song_done && !paused && !snd_is_playing(track1_instance) && trackpos < (track_length - 0.5))
        {
            emergency_reload();
            exit;
        }
        _truetrackpos = audio_sound_get_track_position(track1_main);
        if (muted && muted_time != _truetrackpos)
        {
            muted = false;
            debug_print("huh???");
        }
        var _posdiff = _truetrackpos - trackpos;
        if (lose_con == 0 && !paused && _posdiff == 0 && trackpos < (track_length - 0.5))
        {
            safety_timer++;
            if (safety_timer >= 20)
            {
                if (!safety_mode)
                {
                    safety_mode = 1;
                    muted = true;
                    muted_time = _truetrackpos;
                    debug_print("safety mode engaged");
                }
            }
        }
        else if (!paused && abs(_posdiff) > 0.05 && abs(_posdiff) < 0.5 && lose_con == 0 && song_id != 4 && !muted)
        {
            if (smooth_timer == 0)
            {
                smooth_timer = 6;
                safety_mode = true;
                safety_pos = trackpos;
                debug_print("anti-stutter triggered (" + string(round(_posdiff * 1000)) + "ms)");
            }
            else
            {
                smooth_timer--;
            }
            if (smooth_timer == 0)
            {
                debug_print("track fixed itself");
                safety_mode = false;
            }
        }
        else if (smooth_timer > 0)
        {
            safety_pos = _truetrackpos;
            safety_mode = false;
            safety_timer = 0;
            smooth_timer = 0;
            debug_print("track re-synced");
        }
        else if (safety_timer > 0 && _posdiff != 0)
        {
            safety_timer = 0;
        }
        if (safety_mode && lose_con == 0)
        {
            if (smooth_timer > 0 && !muted)
            {
                safety_pos += (delta_time / 1000000);
                trackpos = remap(6, 0, safety_pos, _truetrackpos, smooth_timer);
            }
            else
            {
                trackpos += ((delta_time / 1000000) * pitch);
            }
            if (loop && trackpos >= track_length)
                trackpos -= track_length;
        }
        else if (!loop && song_done && lose_con == 0)
        {
            if (song_id == 4)
                trackpos += ((delta_time / 1000000) * pitch);
            else
                trackpos += ((delta_time / 1000000) * pitch);
            if (trackpos > (track_length + (meter * 4)))
                trackpos -= (meter * 2);
        }
        else if (!tenna_boss && _truetrackpos == 0 && _truetrackpos < trackpos && trackpos > (track_length - 4))
        {
            trackpos = track_length;
        }
        else if (rewind)
        {
            trackpos = lerp(rewind_start, 0, rewind_timer / 30);
            rewind_timer++;
        }
        else
        {
            trackpos = _truetrackpos;
        }
    }
    if (song_id == 4)
    {
        pitch = remap_clamped(12, 15.25, 1, 0.1, trackpos);
        audio_sound_pitch(track1_main, pitch);
        audio_sound_pitch(track2_main, pitch);
    }
    if (reloading)
    {
        audio_sound_set_track_position(track1_instance, remtrackpos[0]);
        audio_sound_set_track_position(track2_instance, remtrackpos[0]);
        if (song_id == 0)
        {
            audio_sound_set_track_position(track1_solo_instance, remtrackpos[0]);
            audio_sound_set_track_position(track2_solo_instance, remtrackpos[0]);
        }
        reloading = false;
    }
    if (pitch != 1 && lose_con == 0 && song_id != 4)
    {
        debug_print("restoring pitch");
        pitch = scr_movetowards(pitch, 1, 0.025);
        audio_sound_pitch(track1_main, pitch);
        audio_sound_pitch(track2_main, pitch);
        if (song_id == 0)
        {
            audio_sound_pitch(track1_solo_instance, pitch);
            audio_sound_pitch(track2_solo_instance, pitch);
        }
    }
    if (song_id != 0)
    {
    }
    else if (solo_con == 0 && trackpos >= (timestamp[0] - 2))
    {
        if (solo_difficulty < 0)
        {
            if (fame >= 10000)
                solo_difficulty = 2;
            else if (fame >= 6000)
                solo_difficulty = 1;
            else
                solo_difficulty = 0;
            if (scr_debug())
            {
                if (solo_difficulty == 0)
                    scr_debug_print("solo will be easy (" + string(fame) + "/5000 pts)");
                if (solo_difficulty == 1)
                    scr_debug_print("solo will be medium (" + string(fame) + "/5000 pts)");
                if (solo_difficulty == 2)
                    scr_debug_print("solo will be hard (" + string(fame) + "/10000 pts)");
            }
        }
        scr_rhythmgame_notechart_lead_solo(solo_difficulty);
        scr_rhythmgame_notechart_lead_finale();
        var _track_offset = timestamp[solo_difficulty] - (timestamp[0] - trackpos);
        if (solo_difficulty == 0)
            _track_offset = trackpos;
        if (!safety_mode || smooth_timer > 0)
        {
            audio_sound_set_track_position(track1_solo_instance, _track_offset);
            audio_sound_set_track_position(track2_solo_instance, _track_offset);
        }
        solo_con = 1;
    }
    else if (solo_con == 1 && trackpos >= timestamp[0])
    {
        debug_print("leapt to solo");
        if (solo_difficulty != 0)
        {
            if (safety_mode)
            {
                trackpos += (timestamp[solo_difficulty] - timestamp[0]);
            }
            else
            {
                trackpos = audio_sound_get_track_position(track1_solo_instance);
                audio_sound_set_track_position(track1_instance, trackpos);
                audio_sound_set_track_position(track2_instance, trackpos);
            }
        }
        mus_volume(track1_solo_instance, 0, 0);
        mus_volume(track2_solo_instance, main_vol, 0);
        mus_volume(track1_instance, 0, 0);
        mus_volume(track2_instance, 0, 0);
        track1_main = track1_solo_instance;
        track2_main = track2_solo_instance;
        solo_con = 2;
    }
    else if (solo_con == 2 && trackpos >= (timestamp[solo_difficulty + 1] - 2))
    {
        debug_print("preparing post-solo");
        var _track_offset = timestamp[3] - (timestamp[solo_difficulty + 1] - trackpos);
        if (!safety_mode || smooth_timer > 0)
        {
            audio_sound_set_track_position(track1_instance, _track_offset);
            audio_sound_set_track_position(track2_instance, _track_offset);
        }
        solo_con = 3;
    }
    else if (solo_con == 3 && trackpos >= timestamp[solo_difficulty + 1])
    {
        debug_print("solo done");
        if (safety_mode)
        {
            if (solo_difficulty < 3)
                trackpos += (timestamp[3] - timestamp[solo_difficulty + 1]);
        }
        else
        {
            trackpos = audio_sound_get_track_position(track1_instance);
        }
        mus_volume(track1_solo_instance, 0, 0);
        mus_volume(track2_solo_instance, 0, 0);
        mus_volume(track1_instance, 0, 0);
        mus_volume(track2_instance, main_vol, 0);
        track1_main = track1_instance;
        track2_main = track2_instance;
        solo_con = 4;
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
    var _notetime = 0;
    while (notecheck < maxnote)
    {
        notecheckmax++;
        _notetime = notetime[notecheck] - trackpos;
        if (hardmode)
        {
            if (_notetime >= -0.2 && _notetime <= 0.12)
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
        else if (abs(_notetime) <= 0.12)
        {
            foundnotes = 1;
            targetnote[notecheckmax] = notecheck;
            notecheck++;
        }
        else if (auto_play == 1 && _notetime < 0)
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
    for (i = 0; i < 2; i++)
    {
        var checkpress, holdpress;
        if (i == 0)
        {
            checkpress = buttonb_p() || left_p();
            holdpress = buttonb_h() || left_h();
        }
        if (i == 1)
        {
            checkpress = buttonr_p() || right_p();
            holdpress = buttonr_h() || right_h();
        }
        if (auto_play != 0 || lose_con == 2)
        {
            checkpress = false;
            holdpress = false;
        }
        if (auto_play == 1)
        {
            if (hold_end[i] > 0 && trackpos < hold_end[i])
            {
                holdpress = true;
            }
            else
            {
                for (var notei = 0; notei <= notecheckmax; notei++)
                {
                    var _leniency = 0.1;
                    if (notetype[targetnote[notei]] == i && notealive[targetnote[notei]] == 1 && notetime[targetnote[notei]] <= (trackpos + (averagetimeunit * _leniency)))
                    {
                        checkpress = true;
                        holdpress = true;
                        break;
                    }
                }
            }
        }
        if (checkpress)
        {
            with (performer)
            {
                if (other.i == 0)
                    sprite_index = spr_kris_guitar;
                else
                    sprite_index = spr_kris_guitar_high;
                event_user(0);
            }
        }
        if (hold_end[i] > 0)
        {
            if (hold_end[i] < trackpos || !holdpress)
            {
                var _holdpos = trackpos;
                if (trackpos >= (hold_end[i] - (averagetimeunit * 3)))
                    _holdpos = max(hold_end[i], _holdpos);
                var chainPoints = floor(((min(hold_end[i], _holdpos) - hold_start[i]) / meter) * 4) * 10;
                if (_holdpos >= hold_end[i])
                {
                    score_scale = 4;
                    chainPoints *= 2;
                    note_hit_timer[i] = 4;
                    if (tenna_boss)
                    {
                        var _holdlength = (hold_end[i] - hold_start[i]) / (meter / 2);
                        scr_tenna_add_score(ceil(_holdlength / 2));
                    }
                }
                else
                {
                    if (oneAtATime)
                        mus_volume(track1_main, main_vol, 0);
                    mus_volume(track2_main, 0, 0);
                    notescore[heldnote[i]] = hold_start[i] - trackpos;
                    if (tenna_boss)
                    {
                        var _holdlength = (trackpos - hold_start[i]) / meter;
                        scr_tenna_add_score(round(_holdlength / 2));
                    }
                }
                heldnote[i] = 0;
                total_score += chainPoints;
                if (tutorial == 0)
                {
                    fame += (chainPoints * fame_mul);
                    total_fame += (chainPoints * fame_mul);
                }
                points += chainPoints;
                max_combo = max(combo, max_combo);
                if (heldnote[1 - i] != 0 && abs(hold_end[i] - hold_start[1 - i]) > 0.1 && !abs(hold_start[i] - hold_start[1 - i]) < 0.1)
                {
                    with (performer)
                    {
                        if (sprite_index == spr_kris_guitar_high)
                        {
                            if (other.i == 1)
                                sprite_index = spr_kris_guitar;
                            else
                                sprite_index = spr_kris_guitar_high_hold;
                        }
                        else
                        {
                            sprite_index = spr_kris_guitar_high;
                        }
                    }
                }
                hold_end[i] = 0;
            }
            else if (trackpos >= hold_start[i])
            {
                performer.image_index = 0;
                hold_score += floor(((trackpos - hold_start[i]) / meter) * 40);
                if (score_scale < 2.5)
                    score_scale += 0.4;
                if (note_hit_timer[i] <= 1)
                    note_hit_timer[i] = 3;
            }
        }
        if (checkpress && buffer[i] <= 0)
        {
            note_hit_timer[i] = 5;
            note_hit_score[i] = 0;
            pressedtimer[i] = 0;
            buffer[i] = 2;
        }
        if (lyrics_index < lyric_count && trackpos > lyric_time[lyrics_index])
        {
            current_lyric = lyrics[lyrics_index];
            censored_lyric = censored_lyrics[lyrics_index];
            lyrics_index++;
            update_lyrics = true;
        }
        var _firstnote = true;
        var _earlypunish = false;
        var _press_buffer = hardmode ? 0 : (room_speed / 10);
        if (pressedtimer[i] <= _press_buffer && foundnotes == 1)
        {
            bonus = (hardmode && fame >= 12000) ? 10 : 0;
            for (var notei = 0; notei <= notecheckmax; notei++)
            {
                if (notetype[targetnote[notei]] == i && notealive[targetnote[notei]] == 1)
                {
                    var _leniency = 1.6;
                    var _famegain = 0;
                    var _noteaccuracy = notetime[targetnote[notei]] - trackpos;
                    if (abs(_noteaccuracy) < (averagetimeunit * _leniency))
                    {
                        notescore[targetnote[notei]] = 100 + bonus;
                        _famegain = 100;
                        great++;
                        if (tenna_boss)
                        {
                            score_var++;
                            if (score_var == 1)
                                scr_tenna_add_score(2);
                            if (score_var == 2)
                                scr_tenna_add_score(1);
                            if (score_var == 3)
                                scr_tenna_add_score(1);
                            if (score_var == 4)
                                scr_tenna_add_score(1);
                            if (score_var == 4)
                                score_var = 0;
                        }
                    }
                    else if (!hardmode || abs(_noteaccuracy) < (averagetimeunit * 2.4))
                    {
                        notescore[targetnote[notei]] = 50 + bonus;
                        if (fame < 5950)
                            _famegain = 60;
                        else
                            _famegain = 50;
                        good++;
                        if (tenna_boss)
                            scr_tenna_add_score(1);
                    }
                    else if (hardmode && _firstnote && pressedtimer[i] == 0)
                    {
                        if (trackpos < notetime[targetnote[notei]])
                        {
                            debug_print("early miss");
                            if (scr_debug() && notei > 0 && notetype[targetnote[notei - 1]] == i && notealive[targetnote[notei - 1]] == 1)
                                debug_print("PREVIOUS NOTE STILL ALIVE DESPITE EARLY MISS");
                            notescore[targetnote[notei]] = 0;
                            notealive[targetnote[notei]] = 0;
                            missnotecon = 1;
                            miss++;
                            snd_play(miss_sound[irandom(1)]);
                        }
                        else
                        {
                            continue;
                        }
                    }
                    else
                    {
                        break;
                    }
                    total_score += notescore[targetnote[notei]];
                    if (missnotecon == 1)
                        last_note_score = -2;
                    else
                        last_note_score = notescore[targetnote[notei]];
                    if (tutorial == 0)
                    {
                        fame += (_famegain * fame_mul);
                        total_fame += (_famegain * fame_mul);
                    }
                    points += notescore[targetnote[notei]];
                    score_scale = min(4, score_scale + (notescore[targetnote[notei]] / 100));
                    if (noteanim[targetnote[notei]] > 0)
                    {
                        if (i == 1)
                            performer.sprite_index = spr_kris_guitar_high_hold;
                    }
                    if (notescore[targetnote[notei]] >= 40 && noteend[targetnote[notei]] > 0)
                    {
                        hold_start[i] = notetime[targetnote[notei]];
                        hold_end[i] = noteend[targetnote[notei]];
                        heldnote[i] = targetnote[notei];
                    }
                    if (notescore[targetnote[notei]] >= 40)
                    {
                        combo++;
                        max_combo = max(combo, max_combo);
                    }
                    notealive[targetnote[notei]] = 0;
                    note_hit_score[i] = notescore[targetnote[notei]];
                    pressedtimer[i] = (room_speed / 10) + 1;
                    if (oneAtATime)
                        mus_volume(track1_main, 0, 0);
                    if (trackpos >= 0)
                        mus_volume(track2_main, main_vol, 0);
                    _firstnote = false;
                    break;
                }
            }
        }
        else if (pressedtimer[i] == 0 && missnotecon != 1 && !game_won && (hardmode || _notetime == 0 || _notetime > ((_press_buffer / 30) + 0.12)))
        {
            snd_play(guitar_sound[irandom(1) + (i * 2)]);
        }
    }
    fame = clamp(fame, 0, max_fame);
    if (scr_debug())
    {
        if (song_initialized && !song_done && loadsong == 3)
        {
            var _skip = false;
            if (keyboard_check_pressed(vk_f5))
            {
                _skip = true;
                fame = 999999;
            }
            if (keyboard_check_pressed(vk_f6))
            {
                fame = 0;
                if (lose_con == 0)
                    lose_con = 1;
            }
            if (_skip)
            {
                total_fame = fame;
                trackpos = track_length;
                audio_stop_all();
                scr_rhythmgame_notechart_clear();
                performer.sprite_index = spr_kris_rock_2;
                with (drums)
                {
                    performer.sprite_index = spr_susie_drum;
                    scr_rhythmgame_notechart_clear();
                    con = -1;
                    fade = 1;
                }
                with (vocals)
                {
                    performer.sprite_index = spr_ralsei_rock_1;
                    scr_rhythmgame_notechart_clear();
                    scr_rhythmgame_clear_all_lyrics();
                }
            }
        }
    }
    with (obj_minigame_quit_ui)
    {
    }
    if ((replayversion || song_id == 0) && !song_done && (loadsong == 3 || loadsong == 2) && lose_con == 1)
    {
        if (replayversion)
            replayquit = 1;
        scr_debug_print_persistent("losing", "losing pitch at " + string(fade));
        if (replayversion)
        {
            with (obj_minigame_quit_ui)
            {
                if (canceltimer < canceltime)
                    canceltimer = canceltime;
            }
        }
        pitch = fade;
        sound_pitch(track1_instance, fade);
        sound_pitch(track2_instance, fade);
        if (song_id == 0)
        {
            sound_pitch(track1_solo_instance, fade);
            sound_pitch(track2_solo_instance, fade);
        }
        if (fade <= 0.5 && !replayquit)
        {
            with (vocals)
            {
                performer.sprite_index = spr_ralsei_rock_surprise;
                performer.image_index = 1;
                performer.image_speed = 0;
            }
        }
        if (fade == 0)
        {
            sound_pause(track1_instance);
            sound_pause(track2_instance);
            if (song_id == 0)
            {
                sound_pause(track1_solo_instance);
                sound_pause(track2_solo_instance);
            }
            with (drums)
            {
            }
            with (vocals)
            {
            }
            lose_con = 2;
            rewind_start = trackpos;
        }
    }
    if (tenna_boss && !song_done && (looptimer + trackpos) >= chart_end)
    {
        song_done = true;
        debug_print("chart done!");
        mus_volume(track1_instance, 1, 30);
        mus_volume(track2_instance, 0, 30);
    }
    if (!rewind && loop && trackpos < remtrackpos[4] && trackpos < 2)
    {
        if (maxnote >= 5)
            last_score[0] = notescore[maxnote - 5];
        if (maxnote >= 4)
            last_score[1] = notescore[maxnote - 4];
        if (maxnote >= 3)
            last_score[2] = notescore[maxnote - 3];
        if (maxnote >= 2)
            last_score[3] = notescore[maxnote - 2];
        if (maxnote >= 1)
            last_score[4] = notescore[maxnote - 1];
        debug_print("song looped");
        minnote = 0;
        remtrackpos[4] = -1;
        remtrackpos[3] -= track_length;
        remtrackpos[2] -= track_length;
        remtrackpos[1] -= track_length;
        remtrackpos[0] -= track_length;
        looptimer = track_length;
        if (tutorial != 1)
        {
            var _notealive = (tutorial < 5) ? 1 : 0;
            for (i = 0; i < maxnote; i++)
            {
                if (loop_start > 0)
                {
                    if (notetime[i] < loop_start)
                        continue;
                    else
                        loop_start = 0;
                }
                notealive[i] = _notealive;
                notescore[i] = 0;
            }
        }
        with (obj_rhythmgame_chart)
            event_user(0);
    }
    else if (!song_done && (trackpos >= track_length || lose_con == 2))
    {
        if ((song_id == 0 && !freeplay) || replayversion == true)
            global.flag[1118] = points;
        if (fame > 0 && lose_con == 0)
        {
            game_won = true;
            debug_print("YOU WON!!");
            savemiss = miss;
            savegreat = great;
            saveokay = okay;
            savegood = good;
            savehurt = hurt_counter;
            scr_script_delayed(snd_free_all, 30);
            instance_create(0, 100, obj_minigame_evaluation);
        }
        else
        {
            debug_print("YOU DIDN'T WIN!!");
        }
        song_done = true;
        if (scr_debug())
            fastforward = false;
    }
}
with (obj_rhythmgame_chart)
    trackpos = other.trackpos;
