timer = 0;
con = 0;
image_xscale = 900;
image_yscale = 1;
scr_bullet_init();
active = 1;
destroyonhit = 0;
damage = 1;
grazepoints = 4;
if (i_ex(obj_sword_vortex_manager))
    grazepoints = 2;
if (i_ex(obj_tracking_swords_manager) && obj_tracking_swords_manager.variant == 1)
    grazepoints = 2;
timepoints = 11;
