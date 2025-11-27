if (!init && image_index >= 2)
{
    if (!silent)
        snd_play_pitch(snd_explosion_firework, 1.1 + random(0.4));
    init = 1;
    if (!reflected)
    {
        hitboxA = instance_create(x + 50, y + 88, obj_susiezilla_enemy_hitbox);
        hitboxA.knockback = -1;
        scr_copy_hitbox(hitboxA);
        hitboxA.timer = 5;
        hitboxA.damage = 30;
    }
    hitboxB = instance_create(x + 50, y + 88, obj_susiezilla_player_hitbox);
    hitboxB.knockback = -1;
    scr_copy_hitbox(hitboxB);
    hitboxB.timer = 5;
    hitboxB.damage = 30;
}
if (init == 1 && image_index >= 5)
{
    if (instance_exists(hitboxA))
        instance_destroy(hitboxA);
    if (instance_exists(hitboxB))
        instance_destroy(hitboxB);
    init = 2;
}
