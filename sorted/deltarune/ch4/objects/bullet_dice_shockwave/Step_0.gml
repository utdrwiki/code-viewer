if (x < (__view_get(e__VW.XView, 0) - 80))
    instance_destroy();
if (x > (__view_get(e__VW.XView, 0) + 760))
    instance_destroy();
if (y < (__view_get(e__VW.YView, 0) - 80))
    instance_destroy();
if (y > (__view_get(e__VW.YView, 0) + 580))
    instance_destroy();
var dist = 20 * image_xscale;
timer++;
if (timer == 2 && count > 0)
{
    count--;
    shockwave = instance_create(x + lengthdir_x(dist, direction), y + lengthdir_y(dist, direction), obj_bullet_dice_shockwave);
    shockwave.direction = direction;
    shockwave.image_xscale = image_xscale;
    shockwave.image_yscale = image_yscale;
    shockwave.image_blend = image_blend;
    shockwave.count = count;
    mask_index = spr_pippins_shockwave;
}
if (timer == 8)
    instance_destroy();

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
