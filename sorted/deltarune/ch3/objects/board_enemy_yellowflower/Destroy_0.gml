if (instance_number(obj_board_enemy_yellowflower) == 1)
{
    with (obj_board_enemy_monster)
    {
        if (spearboss == true)
        {
            image_speed = 0.3;
            spearboss = false;
            spearbosscon = 2;
            bulletimer = 0;
            instance_create(x, y, obj_shake);
            snd_play(snd_impact);
            with (obj_board_miniboss_wall)
                instance_destroy();
            hp = ceil(hp / 2);
            maxhp = ceil(maxhp / 2);
        }
    }
}
