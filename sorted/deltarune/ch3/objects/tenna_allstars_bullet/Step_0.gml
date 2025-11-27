laugh_timer += 0.25;
if (timer >= 140 && state == 0)
    state = 1;
if (state == 0)
{
    image_alpha = scr_approach(image_alpha, 1, 0.05);
    if (image_alpha == 1)
        active = true;
    image_xscale = scr_approach(image_xscale, size, 0.05);
    image_yscale = scr_approach(image_yscale, size, 0.05);
}
if (state == 1)
{
    active = false;
    image_xscale = scr_approach(image_xscale, 0, 0.05);
    image_yscale = scr_approach(image_yscale, 0, 0.05);
    image_alpha = scr_approach(image_alpha, 0, 0.05);
    if (image_xscale == 0)
        instance_destroy();
}
