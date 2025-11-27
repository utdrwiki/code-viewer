image_xscale += (0.1 * impact);
image_yscale = image_xscale;
image_alpha -= 0.02;
if (image_alpha <= 0 || image_xscale < 0)
    instance_destroy();
