var _angle = (timer * (360 / duration)) + ((image_xscale < 0) ? 180 : 0);
x = xstart + lengthdir_x(15, _angle);
y = ystart + lengthdir_y(15, _angle);
timer++;
image_alpha = 2 - ((timer / duration) * 2);
if (timer > duration)
    instance_destroy();
