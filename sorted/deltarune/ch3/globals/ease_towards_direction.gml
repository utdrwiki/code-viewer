function scr_ease_towards_direction()
{
    return median(-argument2, argument2, (1 - argument3) * angle_difference(argument1, argument0));
}

function scr_ease_towards_direction_angle()
{
    image_angle += median(-argument1, argument1, (1 - argument2) * angle_difference(argument0, image_angle));
    exit;
}

function scr_ease_towards_direction_manual()
{
    direction += median(-argument1, argument1, (1 - argument2) * angle_difference(argument0, direction));
    exit;
}
