if (!i_ex(obj_darkshape_manager))
    exit;
var hx = obj_heart.x + 10;
var hy = obj_heart.y + 10;
if (fast_timer)
{
    timer += fastval;
    fast_timer--;
}
else
{
    timer++;
}
true_timer++;
if (!irandom(20))
    fast_timer = 10 + irandom(6);
if (image_alpha != 1)
{
    image_alpha = scr_approach(image_alpha, 1, 0.025);
    if (image_alpha == 1)
        direction = scr_at_player(x, y);
}
y += ypush;
ypush *= 0.9;
if (image_alpha == 1)
{
    xscale = image_alpha;
    yscale = image_alpha;
}
else
{
    xscale = image_alpha + ((timer % 2) * 0.1);
    yscale = image_alpha + ((timer % 2) * 0.1);
}
if (image_alpha == 1)
    active = true;
else
    exit;
tracking_val = scr_approach(tracking_val, 16, 0.025);
chase_heart();
do_shrivel();
if (x < (__view_get(e__VW.XView, 0) - 80))
    instance_destroy();
if (x > (__view_get(e__VW.XView, 0) + 760))
    instance_destroy();
if (y < (__view_get(e__VW.YView, 0) - 80))
    instance_destroy();
if (y > (__view_get(e__VW.YView, 0) + 580))
    instance_destroy();
do_pushback();
check_death();

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
