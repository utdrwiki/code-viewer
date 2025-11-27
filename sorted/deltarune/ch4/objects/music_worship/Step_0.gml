var buff = 1;
var mastervol = 0.7;
var minpitch = 0.4;
var maxpitch = 0.6;
if (init == 0)
{
    astream = snd_init(song);
    tracklength = audio_sound_length(astream);
    track1 = mus_loop(astream);
    track2 = mus_loop(astream);
    audio_sound_set_track_position(track1, tracklength / 2);
    snd_pitch(track1, 0.5);
    snd_volume(track1, 0, 0);
    snd_volume(track1, mastervol, 30);
    snd_pitch(track2, 0.5);
    snd_volume(track2, 0, 0);
    audio_sound_set_track_position(track2, tracklength / 2);
    init = 1;
    targtime = 30 * choose(2, 2, 2, 3, 4);
}
if (con == 0 && pause != 2)
{
    timer++;
    if (timer == (targtime - buff))
    {
        changecount++;
        if ((changecount % 3) == 0)
        {
            var curpitch = audio_sound_get_pitch(track1);
            debug_message(curpitch);
            var randadj = random(0.1);
            if (curpitch == maxpitch)
            {
                randadj = -randadj;
            }
            else if (curpitch == minpitch)
            {
            }
            else
            {
                randadj = randadj * choose(-1, 1);
            }
            snd_pitch(track2, clamp(curpitch + randadj, minpitch, maxpitch));
        }
        audio_sound_set_track_position(track2, random_range(2, tracklength - 6));
        snd_volume(track2, mastervol, buff);
        snd_volume(track1, 0, buff);
    }
    if (timer >= targtime)
    {
        con = 1;
        timer = 0;
        targtime = 30 * choose(2, 2, 2, 3, 4);
    }
}
if (con == 1 && pause != 2)
{
    timer++;
    if (timer == (targtime - buff))
    {
        changecount++;
        if ((changecount % 3) == 0)
        {
            var curpitch = audio_sound_get_pitch(track2);
            debug_message(curpitch);
            var randadj = random(0.1);
            if (curpitch == maxpitch)
            {
                randadj = -randadj;
            }
            else if (curpitch == minpitch)
            {
            }
            else
            {
                randadj = randadj * choose(-1, 1);
            }
            snd_pitch(track1, clamp(curpitch + randadj, minpitch, maxpitch));
        }
        audio_sound_set_track_position(track1, random_range(2, tracklength - 6));
        snd_volume(track1, mastervol, buff);
        snd_volume(track2, 0, buff);
    }
    if (timer >= targtime)
    {
        con = 0;
        timer = 0;
        targtime = 30 * choose(2, 2, 2, 3, 4);
    }
}
if (fade == 0)
{
    var trig = 0;
    with (obj_doorparent)
    {
        if (touched)
            trig = 1;
    }
    if (trig)
    {
        fade = 1;
        con = 99;
        snd_volume(track1, 0, 14);
        snd_volume(track2, 0, 14);
        scr_doom(id, 14);
    }
}
if (pause == 1)
{
    pause = 2;
    memval1 = audio_sound_get_gain(track1);
    memval2 = audio_sound_get_gain(track2);
    debug_print("memval1:" + string(memval1));
    debug_print("memval2:" + string(memval2));
    snd_volume(track1, 0, 14);
    snd_volume(track2, 0, 14);
}
if (resume)
{
    if (pause == 2)
    {
        debug_print("resume");
        resume = 0;
        pause = 0;
        snd_volume(track1, memval1, 14);
        snd_volume(track2, memval2, 14);
    }
}
