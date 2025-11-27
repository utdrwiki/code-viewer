var _list = ds_list_create();
var _num;
if (circle)
    _num = collision_circle_list(x, y, radius, obj_confetti_overworld, false, true, _list, false);
else
    _num = collision_rectangle_list(x - (size.x / 2), y - (size.y / 2), x + (size.x / 2), y + (size.y / 2), obj_confetti_overworld, false, true, _list, false);
if (_num > 0)
{
    for (i = 0; i < _num; i++)
    {
        with (ds_list_find_value(_list, i))
        {
            if (!airborne)
            {
                airborne = true;
                fallspeed = -other.upward_force;
                speed = other.force;
                if (radial)
                    direction = point_direction(other.x, other.y, x, y);
                else
                    direction = other.direction;
                event_user(0);
            }
        }
    }
}
if (lifetime > 0)
{
    lifetime--;
    if (lifetime <= 0)
        instance_destroy();
}
