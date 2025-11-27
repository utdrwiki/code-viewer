scr_bullet_init();
image_alpha = 1;
if (!instance_exists(obj_heart))
    instance_destroy();
wall_destroy = 0;
destroyonhit = false;
timepoints = 0;
width = 56;
height = 13;
cycle_length = 90;
cycle_length2 = 180;
timer = 0;
timer2 = 0;
basex = x;
basey = y;
grazed = 1;
doomed = false;
rate = 1;
base_rate = 1;
trail_length = 2;
for (var i = 1; i <= trail_length; i++)
{
    orb[i] = instance_create(x, y, obj_ghosthouse_dot);
    orb[i].float = -1;
}
grazed = true;
grazepoints = 0;
image_speed = 0.25;
with (obj_dbulletcontroller)
    scr_bullet_inherit(other.id);
iris = true;
iris_dir = scr_at_player();
