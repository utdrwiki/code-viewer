if (abs(angle_difference(point_direction(x, y, other.x, other.y), opening)) <= openingsize)
    return;
if (destroyable == true)
{
    if (other.big == 0)
    {
        with (other)
            event_user(0)
    }
    anim = instance_create(x, y, obj_yshot_anim)
    anim.image_xscale = image_xscale
    anim.image_yscale = image_yscale
    with (anim)
        sprite_index = spr_yheart_shot_hit3
    instance_destroy()
}
else if (destroyable == -1)
{
    angle_speed = 0
    with (other)
        event_user(0)
    hit = 1
    image_blend = c_red
}
