scr_bullet_init();
image_alpha = 1;
if (!instance_exists(obj_heart))
    instance_destroy();
wall_destroy = 0;
destroyonhit = 0;
hspeed = -3;
scale = irandom_range(50, 150);
scale2 = scale;
image_angle = 180;
image_yscale = 0;
wait = 15;
yscale2 = 0;
rot = irandom(360);
angle = 0;
alarm[0] = 1;
side = 0;
if (y > (cameray() + 100))
{
    image_angle = 0;
    side = 0;
}
else
{
    side = 1;
    y += 24;
}
