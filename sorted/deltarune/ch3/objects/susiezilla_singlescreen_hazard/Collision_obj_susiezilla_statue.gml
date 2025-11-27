if (friendly)
    exit;
with (obj_susiezilla_gamecontroller)
{
    if (gameover)
        exit;
}
with (scr_dark_marker(x, y, spr_dogcar_hit))
{
    scr_doom(id, 4);
    scr_scale(4, id);
    scr_lerpvar_instance(id, "image_xscale", 4, 1, 4);
    scr_lerpvar_instance(id, "image_yscale", 4, 1, 4);
    depth = other.depth - 100;
}
with (other.id)
    take_hit(other.facing, other.damage, other.knockback);
if (destroy_onhit)
    instance_destroy();
