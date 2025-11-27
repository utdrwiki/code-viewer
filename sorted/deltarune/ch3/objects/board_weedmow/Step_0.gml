if (active)
{
    if (place_meeting(x, y, obj_board_lawnmower))
    {
        snd_stop(snd_board_kill);
        snd_play(snd_board_kill);
        with (obj_board_event_lawnmower)
            mowscore++;
        instance_destroy();
    }
}
