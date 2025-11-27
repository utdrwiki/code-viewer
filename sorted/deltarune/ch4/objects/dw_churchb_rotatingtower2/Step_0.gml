if (i_ex(obj_climb_kris))
    ialpha += 0.05;
else
    ialpha -= 0.05;
ialpha = clamp(ialpha, 0, 0.6);
layer_background_alpha(back_id, ialpha);
