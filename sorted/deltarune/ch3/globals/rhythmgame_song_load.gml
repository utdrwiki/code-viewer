function scr_rhythmgame_load_song(arg0 = 0, arg1 = true, arg2 = true, arg3 = false)
{
    if (song_loaded && !arg3)
        scr_rhythmgame_song_reset();
    song_id = arg0;
    notetime[0] = 0;
    notespeed = 150;
    loop = false;
    scr_debug_print("trying to load");
    if (arg0 == 0)
    {
        track1_id = "ch3_karaoke_no_guitar.ogg";
        track2_id = "ch3_karaoke_full.ogg";
        oneAtATime = true;
        dynamic_solo = true;
        bpm = 230;
        startoffset = 0;
        track_length = 174.26;
        notespacing = 60 / bpm;
        meter = notespacing * 4;
        if ((scr_debug() && arg3) || (v_ex("debugsong") && debugsong))
            trackstart = scr_round_to_beat(14.5, bpm);
        else
            trackstart = 0;
        timestamp[0] = scr_round_to_beat(37.56, bpm, 1) - notespacing;
        timestamp[1] = scr_round_to_beat(58.43, bpm, 1) - notespacing;
        timestamp[2] = scr_round_to_beat(79.3, bpm, 1) - notespacing;
        timestamp[3] = scr_round_to_beat(100.17, bpm, 1) - notespacing;
        scr_debug_print("Loading main song");
    }
    else if (arg0 == 1)
    {
        track1_id = "ch3-practice_song_noguit.ogg";
        track2_id = "ch3-practice_song_combined.ogg";
        oneAtATime = true;
        bpm = 75;
        startoffset = 0;
        track_length = 24;
        trackstart = 0;
        notespeed = 90;
        scr_debug_print("Loading practice song");
    }
    else if (arg0 == 2)
    {
        track1_id = "tenna_battle.ogg";
        track2_id = "tenna_battle_guitar.ogg";
        scr_debug_print("Loading tenna_battle");
        oneAtATime = false;
        track_length = 165.405;
        bpm = 148;
        notespeed = 120;
        notespacing = 60 / bpm;
        meter = notespacing * 4;
        if (i_ex(obj_rhythmgame))
        {
            if (obj_rhythmgame.tenna_boss)
                loop = true;
            else
                trackstart = 0 - (meter * 1);
        }
    }
    else if (arg0 == 3)
    {
        track1_id = "ch3_tvtime.ogg";
        track2_id = "ch3_tvtime_guitar.ogg";
        scr_debug_print("Tutorial time!");
        trackstart = 0;
        oneAtATime = true;
        track_length = 32.842;
        bpm = 190;
        loop = true;
        notespacing = 60 / bpm;
        meter = notespacing * 4;
        trackstart = 0 - meter;
    }
    else if (arg0 == 4)
    {
        track1_id = "board4_rhythm.ogg";
        track2_id = "board4_rhythm.ogg";
        scr_debug_print("Loading very good board 4 song");
        trackstart = (room == room_dw_rhythm || arg3) ? 8 : 0;
        oneAtATime = true;
        track_length = 15.265;
        notespeed = 30;
        bpm = 60;
    }
    else if (arg0 == 5)
    {
        track1_id = "rudebuster_boss.ogg";
        track2_id = "rudebuster_boss.ogg";
        scr_debug_print("Time to get FUNKY");
        trackstart = 0;
        oneAtATime = true;
        track_length = 143.384;
        bpm = 140;
    }
    else if (arg0 == 6)
    {
        track1_id = "battle_vapor.ogg";
        track2_id = "battle_vapor.ogg";
        scr_debug_print("Loading battle_vapor");
        trackstart = 7;
        oneAtATime = true;
        bpm = 200;
    }
    else if (arg0 == 7)
    {
        track1_id = "tenna_battle_old.ogg";
        track2_id = "tenna_battle_old.ogg";
        scr_debug_print("Loading tenna_battle_old");
        trackstart = 0;
        oneAtATime = true;
        track_length = 127.92;
        bpm = 148;
        notespeed = 120;
    }
    if (arg3)
    {
        notespacing = 60 / bpm;
        meter = notespacing * 4;
    }
    else if (arg0 >= 0)
    {
        scr_debug_print("loading da other stuff");
        notespacing = 60 / bpm;
        meter = notespacing * 4;
        scr_rhythmgame_notechart_lead(arg0);
        if (tutorial > 0)
            scr_rhythmgame_toggle_notes(false);
        musicm.bpm = bpm;
        musicm.beat_offset += bpm / 2;
        if (arg1)
        {
            with (drums)
            {
                scr_rhythmgame_notechart_drums(arg0);
                bpm = other.bpm;
                notespacing = other.notespacing;
                meter = other.meter;
                loop = other.loop;
            }
        }
        if (arg2)
        {
            with (vocals)
            {
                scr_rhythmgame_notechart_vocals(arg0);
                bpm = other.bpm;
                notespacing = other.notespacing;
                meter = other.meter;
                loop = other.loop;
                if (i_ex(obj_rhythmgame) && obj_rhythmgame.tenna_boss)
                {
                    if (maxnote == 0 || chart_start > notetime[0] || (chart_start + (meter * 2)) < notetime[0])
                        performer.sprite_index = spr_ralsei_sing_clap;
                }
            }
        }
        scr_rhythmgame_load_events(arg0);
    }
}

function scr_rhythmgame_song_reset()
{
    timestamp = [];
    timestamp[0] = 0;
    dynamic_solo = false;
    track1_id = 0;
    track2_id = 0;
    song_id = -1;
    oneAtATime = false;
    bpm = 230;
    notespacing = 60 / bpm;
    meter = notespacing * 4;
}

function scr_rhythmgame_load_events(arg0)
{
    if (arg0 == 0)
    {
        with (drums)
        {
            scr_music_event_add_instance(performer, 16.7 - (meter * 6), "sprite_index", spr_susie_drum_ready, true);
            scr_music_event_add_instance(other.performer, 16.7 - (meter * 5.75), "sprite_index", spr_kris_guitar_ready, true);
            scr_music_event_add_instance(other.vocals.performer, 16.7 - (meter * 5.5), "sprite_index", spr_ralsei_sing_polite_closed, true);
            scr_music_event_add(16.7 - (meter * 5), "target_brightness", 0.75);
            scr_music_event_add_instance(other.vocals, 16.7 - (meter * 5), "target_brightness", 0.75);
            scr_music_event_add(16.7 - (meter * 4), "mash_hit", 1, true, 16);
            scr_music_event_add_instance(other.vocals.performer, 16.7 - (meter * 4), "sprite_index", spr_ralsei_rock_shock, true);
            if (!other.spooked && global.plot < 150 && global.flag[1096] == 0)
            {
                scr_music_event_add_instance(other.vocals.performer, 16.7 - (meter * 4), "shakeamt", 10, true);
                other.spooked = true;
            }
            scr_music_event_add(16.939999999999998 - (meter * 4), "con", 0, true);
            scr_music_event_add(18.7 - (meter * 4), "fade", 0.98, false);
            scr_music_event_add_instance(other.vocals.performer, 38, "sprite_index", spr_ralsei_sing_clap, true, 1);
            scr_music_event_add(39, "con", -1, true);
            scr_music_event_add(39.12, "mash_hit", 2, true, 16);
            scr_music_event_add(39.24, "mash_hit", 0, true, 16);
            scr_music_event_add(39.36, "mash_hit", 0, true, 16);
            scr_music_event_add(39.48, "mash_hit", 1, true, 16);
            scr_music_event_add(39.72, "con", 1, true);
            scr_music_event_add(98.09 - meter, "con", 5, true);
            scr_music_event_add_instance(other, 134.5, "smooth", 1, true);
            scr_music_event_add_instance(other.vocals.performer, 134.5, "sprite_index", spr_ralsei_sing_clap, true, 1);
            scr_music_event_add_instance(other, 149.75, "smooth", 0, true);
        }
    }
    else if (arg0 == 1)
    {
        with (drums)
        {
            auto_play = true;
            performer.image_speed = 0.25;
            other.spooked = true;
            scr_music_event_add_instance(performer, trackstart + (meter * 0.5), "sprite_index", spr_susie_drumsticks, true);
            scr_music_event_add_instance(performer, trackstart + (meter * 0.5), "image_index", 1, true);
            scr_music_event_add_instance(other.performer, trackstart + (meter * 1.5), "sprite_index", spr_kris_guitar_ready, true);
            scr_music_event_add_instance(other.vocals.performer, trackstart + (meter * 1), "sprite_index", spr_ralsei_sing_clap, true, 1);
            scr_music_event_add(trackstart + (meter * 2), "fade", 1, false);
            scr_music_event_add_instance(performer, 11, "sprite_index", spr_susie_drumsticks_2, true);
            scr_music_event_add_instance(performer, 14.3, "image_speed", 1, true);
            scr_music_event_add_instance(other.vocals.performer, 14.3, "sprite_index", spr_ralsei_rock_shock, true);
            scr_music_event_add_instance(other.vocals.performer, 14.3, "shakeamt", 10, true);
            scr_music_event_add(14.3, "auto_play", false, true);
            scr_music_event_add(14.3, "con", 7, true);
            scr_music_event_add(20.3, "fade", 0.98, false);
            scr_music_event_add(22.6, "mash_hit", false, true);
            scr_music_event_add(22.6, "con", -1, true);
            scr_music_event_add_instance(performer, 23.5, "sprite_index", spr_susie_drum_ready, true);
            scr_music_event_add_instance(performer, 24, "sprite_index", spr_susie_drum, true);
        }
    }
    else if (arg0 == 2)
    {
        drums.auto_play = 1;
        if (chart_start <= 158.92 && chart_end >= 158.92)
        {
            with (vocals.performer)
            {
                scr_music_event_add(158.92, "mid", 4559, true);
                scr_music_event_add(158.92, "idle", 450, true);
                scr_music_event_add(158.92, "animspeed", 2, true);
                scr_music_event_add(158.92, "sprite_index", spr_ralsei_sing_rude, true);
                scr_music_event_add(162.16, "sprite_index", spr_ralsei_sing_cuss, true);
                scr_music_event_add(162.16, "shakeamt", 10, true);
                scr_music_event_add(162.16, "animspeed", 1, true);
                scr_music_event_add(165.4, "mid", 914, true);
                scr_music_event_add(165.4, "idle", 3513, true);
                scr_music_event_add(165.4, "sprite_index", spr_ralsei_sing_clap, true);
            }
        }
    }
    else if (arg0 == 4)
    {
        scr_music_event_add_instance(other.performer, trackstart + (meter * 1.5), "sprite_index", spr_kris_guitar_ready, true);
    }
    else
    {
        drums.auto_play = true;
        scr_music_event_add_instance(drums.performer, trackstart + (meter * 0.5), "sprite_index", spr_susie_drum_ready, true);
        scr_music_event_add_instance(other.performer, trackstart + (meter * 1.5), "sprite_index", spr_kris_guitar_ready, true);
        scr_music_event_add_instance(vocals.performer, trackstart + (meter * 1), "sprite_index", spr_ralsei_sing_clap, true, 1);
    }
    scr_music_beat_event_instance(obj_rhythmgame, "beat", true, true);
}

function scr_rhythmgame_toggle_notes(arg0, arg1 = true)
{
    if (arg0)
    {
        var _startpoint = scr_ceil_to_beat(trackpos + (meter * 1.5), bpm, 0.25);
        if (_startpoint > track_length)
            loop_start = _startpoint - track_length;
        for (i = 0; i < maxnote; i++)
        {
            if (notetime[i] < _startpoint)
            {
                continue;
            }
            else
            {
                notescore[i] = 0;
                notealive[i] = 1;
            }
        }
    }
    else
    {
        for (i = 0; i < maxnote; i++)
        {
            notescore[i] = arg1 ? 40 : 0;
            notealive[i] = 0;
        }
    }
}
