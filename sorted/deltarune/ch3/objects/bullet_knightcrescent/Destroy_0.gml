var afterimage = scr_afterimage();
afterimage.vspeed = random_range(-0.5, 0.5);
afterimage.image_alpha = 0.35;
if (i_ex(obj_heart))
    afterimage.depth = obj_heart.depth + 1;
