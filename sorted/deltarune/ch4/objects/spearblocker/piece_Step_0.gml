image_angle += (rotatespeed * dir);
timer++;
if (timer > 18)
    image_alpha -= 0.1;
if (image_alpha < 0)
    instance_destroy();
