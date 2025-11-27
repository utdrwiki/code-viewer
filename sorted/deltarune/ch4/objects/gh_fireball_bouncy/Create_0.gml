scr_bullet_init();
image_alpha = 1;
if (!instance_exists(obj_heart))
    instance_destroy();
wall_destroy = 0;
destroyonhit = false;
timepoints = 0;
with (obj_dbulletcontroller)
    scr_bullet_inherit(other.id);
grazed = true;
grazepoints = 0;
doomed = false;
image_index = 2;
iris = false;
iris_dir = -1;
