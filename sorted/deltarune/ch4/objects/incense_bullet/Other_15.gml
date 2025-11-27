if (abs(x - (obj_heart.x + 10)) < 6 && abs(y - (obj_heart.y + 10)) < 6)
{
    if (active == 1)
    {
        if (target != 3)
            scr_damage();
        if (target == 3)
            scr_damage_all();
        if (destroyonhit == 1)
            instance_destroy();
    }
}
