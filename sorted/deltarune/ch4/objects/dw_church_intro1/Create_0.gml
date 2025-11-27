darkinit = 0;
con = 0;
timer = 0;
if (i_ex(obj_dw_transition))
    con = 1;
darkness = instance_create(0, 0, obj_darkness_overlay);
darkness.image_alpha = 0.5;
light = instance_create(320, 240, obj_light_following);
light.size = 240;
