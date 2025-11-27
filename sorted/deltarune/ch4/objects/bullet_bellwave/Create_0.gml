scr_bullet_init();
image_alpha = 1;
if (!instance_exists(obj_heart))
    instance_destroy();
wall_destroy = 1;
bottomfade = 0;
timer = 0;
chainreaction = false;
chainreactiontimer = 0;
damage = 45;
if (i_ex(obj_herosusie))
    damage = 65;
target = 4;
grazepoints = 1.5;
