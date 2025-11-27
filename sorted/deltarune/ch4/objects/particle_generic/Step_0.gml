image_alpha = scr_approach(image_alpha, 0, fade_rate);
image_xscale = scr_approach(image_xscale, 0, shrink_rate);
image_yscale = scr_approach(image_yscale, 0, shrink_rate);
if (acceleration_rate != 0)
{
    switch (acceleration_type)
    {
        case 0:
            speed = scr_approach(speed, acceleration_goal, acceleration_rate);
            break;
        case 1:
            speed *= acceleration_rate;
            break;
    }
}
if (image_xscale == 0 || image_yscale == 0)
    instance_destroy();
if (image_alpha == 0)
    instance_destroy();
