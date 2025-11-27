with (obj_titan_enemy)
{
    if (global.inv < 0)
        other.radius_goal = light_radius;
    else
        other.radius_goal = light_radius * 0.8;
}
