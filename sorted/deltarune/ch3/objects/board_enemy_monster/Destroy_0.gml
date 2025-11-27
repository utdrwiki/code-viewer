if (!i_ex(obj_board_death_event_sword))
{
    if (spearbosscon == 2 || spearboss == true)
    {
        snd_stop(snd_board_door_close);
        snd_play_pitch(snd_board_door_close, 1.2);
        with (obj_board_puzzle_wall)
            con = 1;
        with (obj_board_enemy_yellowflower)
        {
            hurttimer = 10;
            hp = 0;
        }
    }
}
