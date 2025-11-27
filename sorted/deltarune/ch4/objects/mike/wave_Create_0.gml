scr_bullet_init();
image_alpha = 1;
if (!instance_exists(obj_heart))
    instance_destroy();
wall_destroy = 0;
destroyonhit = 0;
image_speed = 0;
hspeed = -4;
scale = 120;
scale2 = scale;
xx = x;
image_angle = 0;
image_yscale = 0;
wait = 30;
mask_index = spr_line_32x1;
if (y < (cameray() + 200))
{
    image_angle = 180;
    hspeed = 4;
}
