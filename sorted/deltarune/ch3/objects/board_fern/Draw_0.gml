if (dir == 0)
    draw_self();
else
    draw_sprite_ext(sprite_index, image_index, x + 32, y, -2, 2, image_angle, image_blend, image_alpha);
