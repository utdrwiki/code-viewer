if (active == true)
{
    if (target != 3)
        scr_damage_proportional()
    if (target == 3)
        scr_damage_all()
    if (destroyonhit == true)
        instance_destroy()
}
