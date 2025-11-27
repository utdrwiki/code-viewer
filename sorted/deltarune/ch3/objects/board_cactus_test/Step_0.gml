scr_depth_board();
hitbuff--;
if (place_meeting(x, y, obj_board_swordhitbox) && hitbuff <= 0)
{
    hitbuff = 10;
    scr_shakeobj();
    snd_play_pitch(snd_damage_bc, 1.2);
    myhealth--;
    if (myhealth == 0)
    {
        instance_create(centerx(), centery(), obj_board_enemydefeatsplash);
        instance_destroy();
    }
}
