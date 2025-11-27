if (active == 1)
{
    damage = 50;
    if (damage != 0)
        scr_damage();
    if (destroyonhit == 1)
        instance_destroy();
}
