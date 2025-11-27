var speed_modifier = 3;
scr_lerpvar("image_alpha", 0, 1, 4 * speed_modifier);
scr_lerpvar("image_index", 5, 0, 6 * speed_modifier);
scr_delay_var("sprite_index", 4949, 7 * speed_modifier);
scr_delay_var("image_index", 0, 7 * speed_modifier);
scr_delay_var("image_speed", 0.2, 7 * speed_modifier);
