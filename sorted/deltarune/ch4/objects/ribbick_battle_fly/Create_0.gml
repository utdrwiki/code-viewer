event_inherited();
image_speed = 0.25;
sin_timer = random(128);
timer = 0;
vspeed = 3;
visible = false;
grazepoints = 3;
if (i_ex(obj_volumeup))
{
    image_xscale = 1.5;
    image_yscale = 1.5;
    grazepoints += 1;
}
