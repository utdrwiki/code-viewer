if (float >= 0)
    float += 0.23;
draw_sprite_ext(sprite_index, image_index, x, y + (1.5 * sin(float + (xstart / 4) + (ystart / 80))), image_xscale, image_yscale, 0, image_blend, 1);
pitch = scr_approach(pitch, 1, 0.003);
