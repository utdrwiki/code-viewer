if (global.turntimer < 1)
    instance_destroy();
if (wall_destroy == 1)
{
    if (x < (__view_get(e__VW.XView, 0) - 80))
        instance_destroy();
    if (x > (__view_get(e__VW.XView, 0) + 760))
        instance_destroy();
    if (y < (__view_get(e__VW.YView, 0) - 80))
        instance_destroy();
    if (y > (__view_get(e__VW.YView, 0) + 580))
        instance_destroy();
}
if (updateimageangle == 1)
    image_angle = direction;
if (spin == 1)
    image_angle += spinspeed;
if (bottomfade != 0)
{
    if (y > (cameray() + bottomfade))
        image_alpha *= 0.8;
}
if (i_ex(obj_growtangle))
{
    if (x >= (obj_growtangle.x - 75) && x <= (obj_growtangle.x + 75) && y >= (obj_growtangle.y - 75) && y <= (obj_growtangle.y + 75))
    {
        insidebox++;
    }
    else if (insidebox > 14 || (insidebox > 0 && sprite_index != spr_magic_book_fire))
    {
        image_alpha -= 0.1;
        if (sprite_index == spr_magic_book_fire)
            image_alpha -= 0.1;
        if (image_alpha <= 0)
            instance_destroy();
    }
}
else
{
    instance_destroy();
}

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
