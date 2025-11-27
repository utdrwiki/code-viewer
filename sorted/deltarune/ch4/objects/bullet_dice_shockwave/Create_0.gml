scr_bullet_init();
destroyonhit = 0;
grazepoints = 14;
timer = 0;
count = 10;
damage = 55;
target = 4;
image_speed = 0.5;
mask_index = spr_nothing;
if (i_ex(obj_volumeup))
{
    image_xscale += 1.5;
    image_yscale += 1.5;
    grazepoints = 12;
}
