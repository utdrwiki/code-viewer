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
deform = true;
scaler = 0;
rate = 1;
base_rate = 1;
type = 0;
with (obj_dbulletcontroller)
    scr_bullet_inherit(other.id);
grazed = true;
grazepoints = 0;
checked = false;
image_speed = 0;
draw_iris = false;
