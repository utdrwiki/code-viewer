var a = (global.hp[2] - 30) / 250;
if (a < 0)
    a = 0;
damage = lerp(12, 90, a);
if (i_ex(obj_sound_of_justice_enemy))
{
    target = 4;
    damage = 67;
}
if (active == 1)
{
    if (target != 3)
        scr_damage();
    if (target == 3)
        scr_damage_all();
    if (destroyonhit == 1)
        instance_destroy();
}
