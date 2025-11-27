if (global.turntimer < 1)
    instance_destroy();
siner++;
image_angle = sin(siner / 3) * 6;
xstart = sin(siner / 6) * 2;
timer++;
if (timer == 30)
    instance_destroy();
