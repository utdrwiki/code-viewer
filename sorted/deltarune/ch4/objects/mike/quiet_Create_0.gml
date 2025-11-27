scr_bullet_init();
image_alpha = 1;
if (!instance_exists(obj_heart))
    instance_destroy();
wall_destroy = 0;
destroyonhit = 0;
image_speed = 0;
type = 0;
rot = irandom(360);
wait = 0;
wait_time = 120;
wave_height = 16;
wave_speed = 4;
