if (instance_exists(parentid))
{
    if (image_angle == 270)
        x = parentid.x + 6;
    else
        x = parentid.x - 6;
}
else
{
    instance_destroy();
    exit;
}
if (global.turntimer < 1)
    instance_destroy();
siner += 1.5;
var _duration = 2.5 * yscale;
if (sin(siner / _duration) < 0)
    instance_destroy();
draw_sprite_ext(sprite_index, image_index, x, y, ((siner / _duration) + 0.75) * xscale, sin(siner / _duration) * yscale, image_angle, image_blend, 1);
