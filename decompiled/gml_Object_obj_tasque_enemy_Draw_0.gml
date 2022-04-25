if (state == 3)
{
    scr_enemyhurt_tired_after_damage(0.5)
    scr_enemy_drawhurt_generic()
    if (global.monster[myself] == false && instance_exists(obj_tasque_manager_enemy))
    {
        with (obj_tasque_manager_enemy)
        {
            violenceused = 1
            global.mercymod[myself] = 0
        }
    }
}
scr_enemy_drawidle_generic(0.16666666666666666)
if (becomeflash == false)
    flash = false
becomeflash = false
