function scr_fire_bullet(arg0, arg1, arg2, arg3, arg4, arg5 = -4, arg6 = 0, arg7 = false, arg8 = 87135)
{
    var bullet;
    if (arg8 != 87135)
        bullet = instance_create_depth(arg0, arg1, arg8, arg2);
    else
        bullet = instance_create(arg0, arg1, arg2);
    with (bullet)
    {
        direction = arg3;
        speed = arg4;
        if (arg5 != -4)
            sprite_index = arg5;
        updateimageangle = arg6;
        if (arg6)
            image_angle = arg3;
        if (arg7)
        {
            with (other)
                scr_bullet_inherit(other.id);
        }
    }
    return bullet;
}

function scr_fire_bullet_colorize(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7 = 0)
{
    var bullet = instance_create(arg0, arg1, arg2);
    with (bullet)
    {
        direction = arg3;
        speed = arg4;
        sprite_index = arg5;
        image_blend = arg6;
        updateimageangle = arg7;
        if (arg7)
            image_angle = arg3;
    }
    return bullet;
}
