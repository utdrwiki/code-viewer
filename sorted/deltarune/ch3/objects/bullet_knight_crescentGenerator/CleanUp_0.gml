with (obj_knight_enemy)
    x = xstart;
with (obj_knight_enemy)
    hspeed = 0;
with (obj_knight_enemy)
{
    with (instance_create_depth(x, y, depth, obj_knight_warp))
    {
        master = other.id;
        event_user(0);
    }
}
