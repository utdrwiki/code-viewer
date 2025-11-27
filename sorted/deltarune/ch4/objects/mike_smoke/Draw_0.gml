draw_sprite_ext(sprite_index, image_index, x, y, scale, scale, image_angle, c_white, image_alpha);
if (act == 0)
    scale += ((1 - scale) * 0.25);
if (act == 1)
{
    image_alpha -= 0.1;
    if (image_alpha <= 0)
        instance_destroy();
}
