scr_bullet_init();
image_alpha = 1;
if (!instance_exists(obj_heart))
    instance_destroy();
wall_destroy = 0;
destroyonhit = false;
timepoints = 0;
width = 60;
cycle_length = 120;
timer = 0;
basex = x;
basey = y;
grazed = 1;
doomed = false;
rate = 1;
base_rate = 1;
with (obj_dbulletcontroller)
    scr_bullet_inherit(other.id);
grazed = true;
grazepoints = 0;
