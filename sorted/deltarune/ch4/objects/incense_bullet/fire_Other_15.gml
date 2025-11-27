if (i_ex(obj_balthizard_enemy) && obj_balthizard_enemy.attackdown)
    damage = round(damage * 0.6);
if (active == 1)
{
    if (target != 3)
        scr_damage();
    if (target == 3)
        scr_damage_all();
    if (destroyonhit == 1)
        instance_destroy();
}
