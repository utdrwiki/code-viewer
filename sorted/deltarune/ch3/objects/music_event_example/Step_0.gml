if (init == 0)
{
    if (obj_rhythmgame.track1_instance != -1)
    {
        musicm.bpm = obj_rhythmgame.bpm;
        musicm.beat_offset = 0.5;
        musicm.track1_instance = obj_rhythmgame.track1_instance;
        init = 1;
    }
}
