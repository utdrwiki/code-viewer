if (facing == 0)
    draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, image_angle, image_blend, image_alpha);
if (facing == 1)
    draw_sprite_ext(sprite_index, image_index, x + 32, y, -2, 2, image_angle, image_blend, image_alpha);
