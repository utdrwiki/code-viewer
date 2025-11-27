image_flipper++;
if ((image_flipper % 8) == 0)
    image_xscale *= -1;
draw_sprite_ext(sprite_index, image_index, round(x / 2) * 2, round(y / 2) * 2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
