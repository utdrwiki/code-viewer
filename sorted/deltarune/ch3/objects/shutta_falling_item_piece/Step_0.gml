image_angle += rotation_spd;
image_alpha -= 0.05;
if (image_alpha == 0)
    instance_destroy();
