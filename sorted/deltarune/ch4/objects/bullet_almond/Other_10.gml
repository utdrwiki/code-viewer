with (obj_bullet_almond)
{
    if (id != other.id)
    {
        if (other.x < x)
        {
            if (point_distance(other.x, other.y, x, y) < 40)
            {
                instance_destroy(other.id);
                break;
            }
        }
        else
        {
            var pointdir = point_direction(x, y, other.x, other.y);
            other.x += lengthdir_x(40, pointdir);
            other.y += lengthdir_y(40, pointdir);
            break;
        }
    }
}
if (i_ex(id))
{
    with (obj_bullet_almond)
    {
        if (id != other.id && point_distance(other.x, other.y, x, y) < 40)
        {
            instance_destroy(other.id);
            break;
        }
    }
}
if (abs(y - obj_growtangle.y) > 90)
    instance_destroy();
