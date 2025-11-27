image_angle += rotspd;
image_alpha -= fadespd;
if (image_alpha < 0)
    instance_destroy();
