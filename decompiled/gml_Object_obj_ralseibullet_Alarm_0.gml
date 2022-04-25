if instance_exists(obj_heart)
{
    move_towards_point((obj_heart.x + 8), (obj_heart.y + 8), 6)
    if (special == true)
        speed = (-speed)
}
