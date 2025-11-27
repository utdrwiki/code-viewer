var side = sign(obj_ghosthouse_lock.image_xscale);
with (instance_create_depth(obj_ghosthouse_lock.x + (32 * side), (obj_ghosthouse_lock.y + (obj_ghosthouse_lock.sprite_height / 2)) - obj_ghosthouse_lock.sprite_yoffset, -10, obj_gh_exitsign))
{
    image_xscale *= side;
    image_angle = 0;
}
