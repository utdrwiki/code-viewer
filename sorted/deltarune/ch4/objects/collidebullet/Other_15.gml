if (active == 1)
{
    if (target != 3)
        scr_damage();
    if (target == 3)
        scr_damage_all();
    if (destroyonhit == 1)
        instance_destroy();
    if (room == room_dw_castle_tv_zone_minigame)
    {
        with (obj_mike_minigame_controller)
            game_over = true;
    }
}
