image_speed = 0;
meowsnd = 0;
act = 0;
action = 0;
xscale = 1;
xscale2 = 1;
yscale = 1;
timer = 0;
xx = 0;
yy = 0;
pet = 0;
pet_max = 7;
if (x > (camerax() + (camerawidth() / 2)))
    image_xscale = -1;
happiness = 100;
happiness_speed = 0.1;
if (x < (camerax() + (camerawidth() / 2)))
    x = camerax() - 100;
else
    x = camerax() + camerawidth() + 100;
oldx = x;
