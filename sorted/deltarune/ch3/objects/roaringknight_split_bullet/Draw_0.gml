image_index = floor(scr_ease_in(anim_timer, 2) * image_number);
if (anim_timer < 1)
    anim_timer += 0.1;
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale + random_range(-0.1, 0.1), image_yscale + random_range(-0.1, 0.1), image_angle, image_blend, image_alpha);
