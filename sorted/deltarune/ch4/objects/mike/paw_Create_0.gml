scr_bullet_init();
image_alpha = 1;
if (!instance_exists(obj_heart))
    instance_destroy();
wall_destroy = 0;
destroyonhit = 0;
action = 0;
wait = 0;
wait_time = 10;
if (y > obj_heart.y)
{
    newy = 64;
}
else
{
    newy = cameraheight() - 64;
    image_angle = 180;
}
