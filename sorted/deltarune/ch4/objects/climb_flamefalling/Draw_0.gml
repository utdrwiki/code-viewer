draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, dir * 90, c_blue, image_alpha);
for (var i = 0; i < 4; i++)
    draw_sprite_ext(sprite_index, image_index + (0.5 * i), x, y, image_xscale + (0.1 * i), image_yscale + (0.05 * i), dir * 90, c_white, 0.45 * image_alpha);
