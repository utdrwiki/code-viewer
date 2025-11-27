damage = 50;
if (i_ex(obj_tenna_enemy))
{
    global.inv = -1;
    if (obj_tenna_enemy.popularboy)
    {
        target = 2;
        damage *= 3;
        scr_damage();
    }
    else
    {
        scr_damage_all();
    }
}
