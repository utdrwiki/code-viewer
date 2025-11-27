if (scr_debug() && keyboard_check_pressed(vk_tab))
    suck = true;
if (suck)
{
    suck *= (1.15 + (0.05 * (room == room_bullettest || (i_ex(obj_jackenstein_enemy) && obj_jackenstein_enemy.scaredycat))));
    x += lengthdir_x(sqrt(suck), scr_at_player());
    y += lengthdir_y(sqrt(suck), scr_at_player());
}
