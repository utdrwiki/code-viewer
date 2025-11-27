if (!i_ex(obj_shadow_mantle_enemy))
{
    instance_destroy();
    exit;
}
timer++;
if (timer == 3)
    instance_destroy();
