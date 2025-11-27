if (!explo)
    exit;
scr_script_delayed(scr_var, 5, "sprite_index", spr_susiezilla_house_close);
scr_script_delayed(scr_lerpvar, 5, "image_index", 0, 5, 10);
scr_script_delayed(scr_var, 15, "sprite_index", spr_susiezilla_house_rise);
scr_script_delayed(scr_lerpvar, 15, "image_index", 0, 9, 18);
scr_script_delayed(scr_var, 33, "sprite_index", spr_susiezilla_house);
scr_script_delayed(scr_var, 33, "image_index", 0);
scr_script_delayed(scr_var, 33, "myhealth", 1);
scr_script_delayed(scr_var, 33, "explo", false);
