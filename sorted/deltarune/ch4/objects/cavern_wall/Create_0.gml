scr_bullet_init();
image_alpha = 1;
image_angle = random(360);
if (!instance_exists(obj_heart))
    instance_destroy();
wall_destroy = 0;
destroyonhit = 0;
scroll_up = 0;
image_blend = c_black;
fade = 0;
flipped = 0;
next = -1;
