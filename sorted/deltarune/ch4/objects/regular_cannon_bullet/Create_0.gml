scr_bullet_init();
spin = 0;
spinspeed = 0;
image_alpha = 1;
if (!instance_exists(obj_heart))
    instance_destroy();
wall_destroy = 1;
bottomfade = 0;
image_angle = direction;
speed_goal = 0;
speed_goal_change = 0;
speed_set = false;
grazepoints = 7;
if (i_ex(obj_volumeup))
{
    image_xscale = 1.5;
    image_yscale = 1.5;
    grazepoints = 12;
}
paused = false;
