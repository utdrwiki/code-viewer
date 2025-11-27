timer++;
if (timer == 22)
{
    var drop_rate = 5;
    if (obj_mainchara_board.myhealth < 8)
        drop_rate += 25;
    if (obj_mainchara_board.myhealth < 3)
        drop_rate += 20;
    drop_rate += (global.shadow_mantle_losses * 2);
    if (drop_rate > 80)
        drop_rate = 80;
    if (i_ex(obj_shadow_mantle_enemy))
    {
        if (obj_shadow_mantle_enemy.darkcandydrop == false && irandom(100) < drop_rate && global.shadow_mantle_losses > 0)
        {
            if (global.shadow_mantle_losses < 7)
                obj_shadow_mantle_enemy.darkcandydrop = true;
            instance_create(x, y, obj_board_heal_pickup);
        }
    }
    instance_destroy();
}
