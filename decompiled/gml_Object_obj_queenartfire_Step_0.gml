image_xscale += growamt
image_yscale += growamt
image_alpha -= fadespeed
if (image_alpha < 0.6 && fadespeed > 0)
    active = false
if (image_alpha <= 0 && fadespeed > 0)
    instance_destroy()
if (hit == 1)
{
    active = false
    image_alpha *= 0.8
}
image_angle = (direction + 90)
