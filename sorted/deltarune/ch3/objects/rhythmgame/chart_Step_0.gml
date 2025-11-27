if (loadsong == 1)
{
    loadsong = 2;
    playtimer = 0;
}
if (loadsong == 2)
{
}
if (obj_rhythmgame.song_initialized)
{
    trackpos = obj_rhythmgame.trackpos;
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
        else if (auto_play == 1 && (notetime[notecheck] - trackpos) < 0)
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
    if (con >= 0 && instrument == 1)
    {
        masher -= rhythmgame.pitch;
        if (masher <= 0)
        {
            if (con < 3)
            {
                mash_hit = con;
            }
            else if (con == 5)
            {
                mash_hit = 0;
                con = 6;
            }
            else if (con == 6)
            {
                mash_hit = 1;
                con = 5;
            }
            else if (con == 7)
            {
                mash_hit = irandom(2);
            }
            else if (con >= 8)
            {
                mash_hit = con - 5;
            }
            masher = mash_speed;
        }
    }
    if (hurt_flash > 0)
        hurt_flash--;
    invc--;
    if (fade > 0 && fade < 1)
        fade -= 0.02;
    for (i = 0; i < 3; i++)
    {
        var checkpress = false;
        var holdpress = false;
        if (mash_hit == i && !auto_play)
        {
            if (fade > 0)
            {
                miss_timer = 10;
                if (fade == 1)
                {
                    with (obj_rhythmgame)
                    {
                        missnotecon = 1;
                        if (fame > 3000)
                            fixed_penalty = 200;
                        else if (song_id == 1)
                            fixed_penalty = 100;
                        else
                            fixed_penalty = -1;
                    }
                    missnotecon = 1;
                }
                if (obj_rhythmgame.song_id != 1)
                    snd_play_x(rhythm_battle_snare, clamp01(fade), rhythmgame.pitch);
            }
            checkpress = true;
            if (v_ex("performer"))
            {
                if (mash_hit == 0)
                    performer.sprite_index = spr_susie_drum_play;
                if (mash_hit == 1)
                    performer.sprite_index = spr_susie_drum_play_right;
                if (mash_hit == 2)
                    performer.sprite_index = spr_susie_drum_play_mid;
                if (mash_hit == 3)
                    performer.sprite_index = spr_susie_drumsticks;
                if (mash_hit == 4)
                    performer.sprite_index = spr_susie_drumsticks_2;
                with (performer)
                    event_user(0);
            }
            mash_hit = -1;
        }
        if (hold_end[i] > 0)
        {
            if (hold_end[i] < trackpos || (!holdpress && !auto_play))
            {
                if (trackpos >= hold_start[i])
                {
                    var chainPoints = (floor(((min(hold_end[i], trackpos) - hold_start[i]) / meter) * 40) * 10) + 50;
                    rhythmgame.total_score += chainPoints;
                    score_scale = 4;
                    rhythmgame.total_fame += chainPoints;
                    if (instrument == 2)
                        performer.sprite_index = performer.idle;
                    if (fade == 1)
                    {
                        if (instrument == 2)
                        {
                            with (rhythmgame)
                            {
                                var _fame_increase = (song_id == 0 && trackpos < 37.56) ? 100 : 0;
                                fame = scr_movetowards(fame, max_fame, _fame_increase);
                            }
                        }
                        combo++;
                    }
                }
                hold_end[i] = 0;
            }
            else if (trackpos >= hold_start[i])
            {
                if (score_scale < 2.5)
                    score_scale += 0.4;
                if (note_hit_timer[i] <= 1)
                    note_hit_timer[i] = 3;
            }
        }
        if (checkpress && buffer[i] <= 0)
        {
            note_hit_timer[i] = 5;
            pressedtimer[i] = 0;
            buffer[i] = 2;
        }
        if ((pressedtimer[i] < (room_speed / 10) || auto_play) && foundnotes == 1 && fade == 1)
        {
            for (var notei = 0; notei <= notecheckmax; notei++)
            {
                if (notetype[targetnote[notei]] == i && notealive[targetnote[notei]] == 1)
                {
                    var leniency = 1.6;
                    if (auto_play)
                    {
                        if (notetime[targetnote[notei]] <= (trackpos + averagetimeunit))
                        {
                            notescore[targetnote[notei]] = 100;
                            if (instrument == 2)
                                performer.sprite_index = performer.mid;
                            if (instrument == 1)
                            {
                                if (auto_play && (tenna_boss || (i_ex(obj_rhythmgame) && obj_rhythmgame.freeplay)))
                                {
                                    if (i == 0)
                                        performer.sprite_index = spr_susie_drum_play_mid;
                                    if (i == 1)
                                        performer.sprite_index = spr_susie_drum_play;
                                }
                                with (performer)
                                    event_user(0);
                            }
                        }
                        else
                        {
                            break;
                        }
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
                    rhythmgame.total_score += notescore[targetnote[notei]];
                    rhythmgame.total_fame += notescore[targetnote[notei]];
                    score_scale = min(4, score_scale + (notescore[targetnote[notei]] / 100));
                    if (notescore[targetnote[notei]] >= 40 && noteend[targetnote[notei]] > 0)
                    {
                        hold_start[i] = notetime[targetnote[notei]];
                        hold_end[i] = noteend[targetnote[notei]];
                    }
                    else if (notescore[targetnote[notei]] >= 40)
                    {
                        if (fade == 1)
                            combo++;
                    }
                    if (notescore[targetnote[notei]] > 0)
                    {
                        if (auto_play)
                        {
                            if (instrument == 2)
                            {
                                note_hit_timer[0] = 0;
                                note_hit_timer[1] = 0;
                                note_hit_timer[2] = 0;
                                note_hit_timer[i] = 3;
                            }
                            note_hit_timer[i] = 5;
                        }
                        note_streak++;
                    }
                    notealive[targetnote[notei]] = 0;
                }
            }
        }
    }
    if (missnotecon == 1)
    {
        missnotecon = 0;
        combo = 0;
        invc = 60;
        if (fade >= 1)
            hurt_flash = 6;
    }
}
