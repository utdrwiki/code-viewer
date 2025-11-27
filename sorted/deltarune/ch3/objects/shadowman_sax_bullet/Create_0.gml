scr_bullet_init();
image_alpha = 1;
if (!instance_exists(obj_heart))
    instance_destroy();
wall_destroy = 1;
init = 0;
bulletPath = 0;
spawnrate = -1;
spawntimer = 0;
spawnchild = 0;
timer = 4;
childOffset = choose(90, -90);
grazepoints = 0.5;
if (i_ex(obj_volumeup))
{
    image_xscale = 1.5;
    image_yscale = 1.5;
    grazepoints += 1;
}
