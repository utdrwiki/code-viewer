speed *= 0.99;
image_xscale += scalerX;
image_yscale += scalerY;
image_index += index_speed;
if (image_index > 4.5)
    instance_destroy();
