event_inherited();
if (dialogue_active && !d_ex())
{
    dialogue_active = false;
    global.interact = 0;
    with (obj_homealone_heart)
        onebuffer = 5;
    alarm[10] = 1;
}
if (is_rotating)
{
    if (!i_ex(obj_homealone_heart))
        exit;
    if (distance_to_object(obj_homealone_heart) < 60)
        sfx_target_volume = 1;
    else
        sfx_target_volume = 0.5;
    sfx_volume = scr_movetowards(sfx_volume, sfx_target_volume, 0.15);
    snd_volume(sfx, sfx_volume, 0);
}
