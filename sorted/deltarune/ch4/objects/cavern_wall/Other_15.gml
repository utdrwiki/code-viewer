snd_stop(snd_damage_bc);
snd_play(snd_damage_bc, 0.5, 0.5 + random(1));
if (active == 1)
{
    if (room == room_dw_castle_tv_zone_minigame)
    {
        with (obj_mike_minigame_controller)
            fuel = scr_approach(fuel, 0, 5);
        if (!snd_is_playing(snd_hurt1))
            snd_play(snd_hurt1);
    }
    if (destroyonhit == 1)
        instance_destroy();
}
