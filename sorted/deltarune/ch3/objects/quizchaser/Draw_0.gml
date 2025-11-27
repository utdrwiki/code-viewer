if (facing == 1)
    draw_sprite_ext(sprite_index, image_index, scr_even(x), scr_even(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (facing == 0)
    draw_sprite_ext(sprite_index, image_index, scr_even(x) + 4, scr_even(y), -image_xscale, image_yscale, image_angle, image_blend, image_alpha);
