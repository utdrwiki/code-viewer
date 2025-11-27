target = 4;
damage = 34;
if (global.tempflag[89] >= 2)
    damage = round(damage / 2);
if (active == 1)
{
    if (target != 3)
        scr_damage();
    if (target == 3)
        scr_damage_all();
    if (destroyonhit == 1)
        instance_destroy();
}
