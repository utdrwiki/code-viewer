image_angle -= 8;
image_alpha -= 0.02;
if (image_alpha <= 0.8)
{
    var _ilerp = scr_remapvalue(0.8, 0, image_alpha, 0, 1);
    h_speed = lerp_ease_in(0, -8, _ilerp, 1);
}
if (image_alpha < 0)
    instance_destroy();
if (mode == 1)
{
    image_xscale += 0.05;
    image_yscale += 0.05;
    image_xscale = clamp(image_xscale, 0, 2);
    image_yscale = clamp(image_yscale, 0, 2);
}
