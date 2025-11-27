var color = make_color_rgb(r, g, b);
draw_sprite_ext(sprite_index, image_index, x + irandom_range(-shakeme, shakeme), y + irandom_range(-shakeme, shakeme), image_xscale, image_yscale, image_angle, color, image_alpha);
