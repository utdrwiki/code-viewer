scr_bullet_init();
image_alpha = 1;
if (!instance_exists(obj_heart))
    instance_destroy();
wall_destroy = 0;
image_blend = c_aqua;
if (x < (camerax() + (camerawidth() / 2)))
    side = 1;
else
    side = -1;
var d = point_direction(camerax() + (camerawidth() / 2), cameray() + (cameraheight() / 2), x, y);
x = xstart + lengthdir_x(150, d);
y = ystart + lengthdir_y(150, d);
for (var i = 0; i < 5; i++)
{
    last_x[i] = 0;
    last_y[i] = 0;
}
last_x[0] = x;
last_y[0] = y - 4;
thrown = 0;
throw_timer = 0;
throwing = 0;
image_speed = 0.5;
friction = 0.1;
wait = 0;
wait_max = 30;
xx = x;
yy = y;
action = 0;
xscale = side;
attack_side = choose(1, -1);
image_xscale = 1;
image_yscale = image_xscale;
alarm[0] = irandom_range(60, 90);
