scr_bullet_init();
image_alpha = 1;
if (!instance_exists(obj_heart))
    instance_destroy();
wall_destroy = 0;
motion_set(point_direction(x, y, obj_mike_controller.x, obj_mike_controller.y), 8);
image_angle = direction;
tail = 0;
image_index = random(10);
