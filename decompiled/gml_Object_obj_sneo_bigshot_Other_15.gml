if (sprite_index == spr_sneo_bigshot_l)
{
    playerhit = 1
    event_user(0)
    with (obj_spamton_neo_enemy)
        event_user(2)
}
else if (sprite_index == spr_sneo_bigshot_s)
{
    if (active == true)
    {
        with (obj_spamton_neo_enemy)
            event_user(2)
        if (destroyonhit == true)
            instance_destroy()
    }
}
