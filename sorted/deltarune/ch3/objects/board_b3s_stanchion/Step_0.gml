if (active)
{
    if (sndbuff > 0)
        sndbuff--;
    if (instance_exists(obj_board_swordhitbox))
    {
        if (place_meeting(x, y, obj_board_swordhitbox))
        {
            var sword = instance_place(x, y, obj_board_swordhitbox);
            if (sword.swordlv > 2)
            {
                instance_create(centerx(), centery(), obj_board_enemydefeatsplash);
                instance_destroy();
            }
            else if (sndbuff <= 0)
            {
                snd_stop(snd_board_sword_metal);
                snd_play(snd_board_sword_metal);
                sndbuff = 10;
            }
        }
    }
}
