target = 3;
damage = 75;
with (obj_knight_enemy)
    aoedamage = true;
if (active == 1)
{
    var _hitbox = 3;
    if (!scr_precise_hit(_hitbox))
        exit;
    if (target != 3)
        scr_damage();
    if (target == 3)
        scr_damage_all();
    if (destroyonhit == 1)
        instance_destroy();
}
with (obj_knight_enemy)
    aoedamage = false;
