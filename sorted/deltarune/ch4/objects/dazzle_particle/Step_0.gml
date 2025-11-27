if (image_xscale > 0)
    image_xscale -= 0.05;
image_yscale = image_xscale;
if (image_xscale == 0)
    instance_destroy();
if (rotspeed > 0)
    rotspeed -= 0.1;
image_angle += rotspeed;
