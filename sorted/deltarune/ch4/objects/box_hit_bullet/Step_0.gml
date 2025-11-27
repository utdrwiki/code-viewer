timer++;
if (timer >= timermax)
    image_alpha *= 0.7;
if (image_alpha < 0.2)
    active = 0;
image_angle += 10;
if (speed < 1)
    instance_destroy();
