xscale[0] = 1 + (sin(current_time / 300) * 0.15);
yscale[0] = 1 + (sin(10 + (current_time / 300)) * 0.15);
draw_sprite_ext(sprite_index, image_index, x, y, xscale[0], yscale[0], image_angle, image_blend, image_alpha);
