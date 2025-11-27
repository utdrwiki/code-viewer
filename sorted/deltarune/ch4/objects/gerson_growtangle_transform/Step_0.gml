if (shrink == true)
{
    with (obj_growtangle)
    {
        maxxscale = lerp(maxxscale, 1.5, 0.2);
        maxyscale = lerp(maxyscale, 1.5, 0.2);
        image_xscale = lerp(image_xscale, 1.5, 0.2);
        image_yscale = lerp(image_yscale, 1.5, 0.2);
        repeat (6)
        {
            if (place_meeting(x, y, obj_heart))
            {
                obj_heart.x += lengthdir_x(1, point_direction(obj_heart.x, obj_heart.y, obj_growtangle.x, obj_growtangle.y));
                obj_heart.y += lengthdir_y(1, point_direction(obj_heart.x, obj_heart.y, obj_growtangle.x, obj_growtangle.y));
            }
        }
    }
}
if (grow == true)
{
    with (obj_growtangle)
    {
        maxxscale = lerp(maxxscale, 2, 0.2);
        maxyscale = lerp(maxyscale, 2, 0.2);
        image_xscale = lerp(image_xscale, 2, 0.2);
        image_yscale = lerp(image_yscale, 2, 0.2);
    }
}
timer++;
if (timer > 30)
    instance_destroy();
if (global.turntimer < 1)
    instance_destroy();
