if (obj_chefs_kris.invincible)
    exit;
if (other.caught && !other.thrown && !other.on_fire)
{
    with (obj_chefs_kris)
        burn_stack();
    instance_destroy();
}
