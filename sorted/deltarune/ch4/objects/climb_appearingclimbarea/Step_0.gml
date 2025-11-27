if (con == 1)
{
    con = 2;
    with (obj_rotating_tower_controller_new)
        set_tile_sprite_ext(other, other.sprite, false);
    climbarea = instance_create(x, y, obj_climb_climbable);
    climbarea.image_xscale = image_xscale;
    climbarea.image_yscale = image_yscale;
}
