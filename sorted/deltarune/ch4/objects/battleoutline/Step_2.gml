image_alpha = min(0.7, image_alpha + 0.04);
if (i_ex(target))
    depth = target.depth - 1;
else
    instance_destroy();
