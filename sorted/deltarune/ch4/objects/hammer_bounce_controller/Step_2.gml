if (timer >= 30 && timer <= 42)
{
    with (obj_growtangle)
    {
        with (obj_heart)
            x += (obj_growtangle.x - obj_growtangle.xprevious);
        with (instance_create(x, y, obj_marker))
        {
            mask_index = spr_battlebg_collision_checker;
            image_angle = other.image_angle;
            image_xscale = other.image_xscale;
            image_yscale = other.image_yscale;
            if (i_ex(obj_heart))
            {
                var pointdir = point_direction(obj_heart.x + 10, obj_heart.y + 10, x, y);
                while (!position_meeting(obj_heart.x + 10, obj_heart.y + 10, id))
                {
                    with (obj_heart)
                    {
                        x += lengthdir_x(1, pointdir);
                        y += lengthdir_y(1, pointdir);
                    }
                }
            }
            instance_destroy();
        }
    }
}
with (obj_oflash)
{
    if (target == other.id)
    {
        x = other.x;
        y = other.y - other.z;
    }
}
