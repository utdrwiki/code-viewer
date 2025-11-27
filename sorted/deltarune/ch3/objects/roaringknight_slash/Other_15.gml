damage = 206;
if (aoe == true)
{
    damage = 75;
    target = 3;
    with (obj_knight_enemy)
        aoedamage = true;
}
if (active == 1)
{
    if (target != 3)
        scr_damage();
    if (target == 3)
        scr_damage_all();
    if (destroyonhit == 1)
        instance_destroy();
}
with (obj_knight_enemy)
    aoedamage = false;
