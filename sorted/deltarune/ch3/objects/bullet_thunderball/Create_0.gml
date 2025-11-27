event_inherited();
scr_bullet_init();
active = false;
image_alpha = 0;
timer = 0;
timerup = 1;
rotating = false;
shakx = 0;
shaky = 0;
freeze = false;
if (i_ex(obj_volumeup))
{
    image_xscale = 2;
    image_yscale = 2;
    grazepoints += 1;
}
