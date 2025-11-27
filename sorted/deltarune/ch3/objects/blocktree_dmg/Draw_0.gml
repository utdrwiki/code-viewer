siner += 1;
draw_sprite_ext(sprite_index, 1, x, y, 2, 2, 0, image_blend, 1);
draw_sprite_ext(sprite_index, 2, x + (sin(siner / 12) * 2), y + (cos(siner / 20) * 2), 2, 2, 0, image_blend, 1);
draw_sprite_ext(sprite_index, 3, x + (sin(siner / 14) * 1), y + (cos(siner / 24) * 1), 2, 2, 0, image_blend, 1);
