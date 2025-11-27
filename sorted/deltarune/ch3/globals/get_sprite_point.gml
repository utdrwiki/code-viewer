function scr_get_sprite_point(arg0 = -4, arg1 = 0.5, arg2 = 0.5, arg3 = true)
{
    var __v2 = new Vector2(0, 0);
    if (arg0 != -4)
    {
        with (arg0)
        {
            __v2.x = (x - sprite_xoffset) + (sprite_width * arg1);
            __v2.y = (y - sprite_yoffset) + (sprite_height * arg2);
            if (arg3)
                __v2 = scr_rotatevector_around(__v2, new Vector2(x, y), image_angle);
        }
    }
    return __v2;
}

function scr_get_sprite_point_x(arg0, arg1 = 0.5, arg2 = true)
{
    return scr_get_sprite_point(arg0, arg1, 0.5, arg2).x;
}

function scr_get_sprite_point_y(arg0, arg1 = 0.5, arg2 = true)
{
    return scr_get_sprite_point(arg0, 0.5, arg1, arg2).y;
}
