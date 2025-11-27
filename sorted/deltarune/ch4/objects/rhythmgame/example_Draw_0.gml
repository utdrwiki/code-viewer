draw_self();
if (song_initialized)
{
    var notespeed = 150;
    var bottomy = cameray() + 360;
    draw_set_color(merge_color(c_fuchsia, c_white, 2 / (pressedtimer[0] + 1)));
    d_line(0, bottomy, 320, bottomy);
    draw_set_color(merge_color(c_blue, c_white, 2 / (pressedtimer[1] + 1)));
    d_line(320, bottomy, 640, bottomy);
    draw_set_color(c_white);
    for (var notei = minnote; notei < maxnote; notei++)
    {
        notey = (bottomy - (notetime[notei] * notespeed)) + (audio_sound_get_track_position(track1_instance) * notespeed);
        if (notey >= -20)
        {
            if (notetime[notei] < remtrackpos[3])
            {
                if (notescore[notei] <= 0 && notealive[notei] == 1)
                    missnotecon = 1;
                notealive[notei] = 0;
                minnote = notei + 1;
            }
            if (notealive[notei] == 1)
                draw_set_color(c_white);
            else
                draw_set_color(c_gray);
            if (notescore[notei] >= 30)
                draw_set_color(c_orange);
            if (notescore[notei] == 100)
                draw_set_color(c_yellow);
            ossafe_fill_rectangle(280 + (notetype[notei] * 40), notey - 6, 280 + (notetype[notei] * 40) + 30, notey, false);
        }
    }
    if (missnotecon == 1)
    {
        snd_play_x(snd_hurt1, 0.6, 0.9);
        mus_volume(track2_instance, 0, 0);
        missnotecon = 2;
        missnotetimer = 0;
    }
    draw_set_color(c_red);
    draw_text(0, 0, trackpos);
    var notey = bottomy - (notetime[0] * notespeed);
    draw_text(0, 30, remtrackpos[3]);
    draw_text(0, 60, notetime[0]);
}
