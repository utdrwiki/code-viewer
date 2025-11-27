target = obj_dbulletcontroller.target;
if (active == 1)
{
    if (i_ex(obj_watercooler_enemy))
    {
        with (obj_watercooler_enemy)
            event_user(2);
    }
    else
    {
        if (target != 3)
            scr_damage();
        if (target == 3)
            scr_damage_all();
        if (destroyonhit == 1)
            instance_destroy();
    }
}
