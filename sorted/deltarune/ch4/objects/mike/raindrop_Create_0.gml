event_inherited();
damage = 0;
gravity = 0.2;
image_xscale = 2;
image_yscale = 2;
harmless = false;
scr_bullet_init();
image_alpha = 1;
if (!instance_exists(obj_heart))
    instance_destroy();
wall_destroy = 0;
tail = 0;
washit = 0;
target = -4;
cols = [255, 4235519, 65535, 32768, 16776960, 16711935, 255];
snds = [96, 169, 24, 541, 315, 291, 14];
