for (c = 0; c < 20; c++)
{
    with (instance_create(x + lengthdir_x(240 * sin_power, c * 18), y + lengthdir_y(240 * cos_power, c * 18), obj_incense_cloud))
    {
        image_alpha = -other.c * 0.025;
        distance = 240;
        current_angle = point_direction(x, y, other.x, other.y);
        image_angle = current_angle - 90;
        sprite_index = spr_incense_cloud;
        var extender = 0;
        with (obj_dbulletcontroller)
        {
            if (type == 111)
                extender = 15;
        }
        if ((other.c % 2) == 0)
        {
            ratio = 1;
            distance_goal = 55 - irandom(5);
            distance_goal += (15 * other.sameattack);
        }
        else
        {
            ratio = (0.66 + random(0.33)) * 2;
            distance_goal = 65 - irandom(10);
            distance_goal += (15 * other.sameattack);
        }
        distance_goal += extender;
    }
}
