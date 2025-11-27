function scr_board_enemy_reset()
{
    hurttimer = 0;
    hitdir = -1;
    is_moving = false;
    is_moving_timer = 0;
    movecon = 0;
    movetimer = 0;
    damagecon = 0;
    damagetimer = 0;
    state = "init";
    timer = 0;
    updatetimer = 0;
    maxhp = hp;
}
