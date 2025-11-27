draw_sprite_ext(sprite_index, image_index, x, y, scale, scale, image_angle, c_white, image_alpha);
scale += ((0.25 - scale) * 0.5);
image_alpha -= 0.1;
if (image_alpha <= 0)
    instance_destroy();
