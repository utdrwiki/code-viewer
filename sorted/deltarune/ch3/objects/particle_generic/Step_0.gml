image_alpha = scr_approach(image_alpha, 0, fade_rate);
image_xscale = scr_approach(image_xscale, 0, shrink_rate);
image_yscale = scr_approach(image_yscale, 0, shrink_rate);
if (image_xscale == 0 || image_yscale == 0)
    instance_destroy();
if (image_alpha == 0)
    instance_destroy();
timer--;
if (timer == 0)
    instance_destroy();
