scr_bullet_init();
event_inherited();
image_alpha = 1;
if (!instance_exists(obj_heart))
    instance_destroy();
max_vspeed = 6;
wall_destroy = 0;
col = 16776960;
walks = false;
image_blend = col;
anchorx = xstart + 160;
lastaction = 0;
israin = false;
is_launched = false;
action = 0;
grabbable = 1;
device = -1;
tough = 0;
for (var i = 0; i < 5; i++)
{
    last_x[i] = 0;
    last_y[i] = 0;
}
last_x[0] = x;
last_y[0] = y - 4;
if (x < (camerax() + (camerawidth() / 2)))
    side = 1;
else
    side = -1;
hspeed = side * irandom_range(2, 5);
image_speed = abs(speed) * 0.33;
wait = 0;
xx = x;
yy = y;
xscale = side;
idle_timer = 0;
image_xscale = 1;
image_yscale = image_xscale;
canmerge = false;
alarm[0] = irandom_range(120, 320);
