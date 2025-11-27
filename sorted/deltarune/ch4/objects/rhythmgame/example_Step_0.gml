if (loadsong == 1)
{
    track1 = snd_init("ch3_karaoke_example_noguit.ogg");
    track2 = snd_init("ch3_karaoke_example_guit_only.ogg");
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
        audio_sound_set_track_position(track1_instance, 13);
        audio_sound_set_track_position(track2_instance, 13);
        loadsong = 3;
        song_initialized = 1;
    }
}
if (song_initialized == 1)
{
    trackpos = audio_sound_get_track_position(track1_instance);
    var timeunit = trackpos - remtrackpos[0];
    var averagetimeunit = ((trackpos - remtrackpos[0]) + (remtrackpos[0] - remtrackpos[1]) + (remtrackpos[1] - remtrackpos[2])) / 3;
    remtrackpos[4] = remtrackpos[3];
    remtrackpos[3] = remtrackpos[2];
    remtrackpos[2] = remtrackpos[1];
    remtrackpos[1] = remtrackpos[0];
    remtrackpos[0] = trackpos;
    if (trackpos < 9)
    {
        snd_free_all();
        room_restart();
    }
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
    for (i = 0; i < 2; i++)
    {
        var checkpress;
        if (i == 0)
        {
            checkpress = button1_p();
            var holdpress = button1_h();
        }
        if (i == 1)
        {
            checkpress = button2_p();
            var holdpress = button2_h();
        }
        if (checkpress && buffer[0] <= 0)
        {
            pressedtimer[i] = 0;
            buffer[0] = 2;
        }
        if (pressedtimer[i] < (room_speed / 10) && foundnotes == 1)
        {
            for (var notei = 0; notei <= notecheckmax; notei++)
            {
                if (notetype[targetnote[notei]] == i && notealive[targetnote[notei]] == 1)
                {
                    var leniency = 1.6;
                    if (abs(notetime[targetnote[notei]] - trackpos) < (averagetimeunit * leniency))
                        notescore[targetnote[notei]] = 100;
                    else if (abs(notetime[targetnote[notei]] - trackpos) < (averagetimeunit * leniency * 1.5))
                        notescore[targetnote[notei]] = 60;
                    else
                        notescore[targetnote[notei]] = 40;
                    notealive[targetnote[notei]] = 0;
                    if (notescore[targetnote[notei]] == 100)
                        snd_play(snd_criticalswing);
                    else
                        snd_play(snd_swing);
                    pressedtimer[i] = (room_speed / 10) + 1;
                    mus_volume(track2_instance, 1, 0);
                }
            }
        }
    }
}
