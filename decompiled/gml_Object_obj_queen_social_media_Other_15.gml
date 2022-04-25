if (active == true)
{
    if handle
    {
        if (target != 3)
            scr_bullet_heal(6)
        if (target == 3)
            scr_healall(6)
    }
    else
    {
        if (target != 3)
            scr_damage()
        if (target == 3)
            scr_damage_all()
    }
    if (destroyonhit == true)
        instance_destroy()
}
