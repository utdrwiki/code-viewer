event_inherited();
timer++;
arcpos += xarc;
y += (cos(arcpos) * archeight);
if (wall_destroy == 1)
{
    if (x < (__view_get(e__VW.XView, 0) - 300))
        instance_destroy();
    if (x > (__view_get(e__VW.XView, 0) + 760))
        instance_destroy();
    if (y < (__view_get(e__VW.YView, 0) - 300))
        instance_destroy();
    if (y > (__view_get(e__VW.YView, 0) + 580))
        instance_destroy();
}
image_alpha = lerp(image_alpha, 1, 0.5);
if (image_yscale)
    image_yscale = lerp(image_yscale, 2, 0.5);
else
    image_yscale = lerp(image_yscale, -2, 0.5);
if (timer >= 3)
{
    var afterimage = instance_create(x, y, obj_afterimage);
    afterimage.sprite_index = sprite_index;
    afterimage.image_index = image_index;
    afterimage.image_blend = image_blend;
    afterimage.image_speed = 0;
    afterimage.depth = depth;
    afterimage.image_xscale = image_xscale;
    afterimage.image_yscale = image_yscale;
    afterimage.image_angle = image_angle;
    afterimage.fadeSpeed = 0.06;
    afterimage.image_alpha = 0.4;
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
