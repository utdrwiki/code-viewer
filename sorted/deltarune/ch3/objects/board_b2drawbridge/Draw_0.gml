if (image_index < 1)
{
    draw_sprite_ext(sprite_index, 0, x, y, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sprite_index, 0, x + 32, y, 2, 2, 0, c_white, 1);
}
else
{
    draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sprite_index, image_index, x + 64, y, -2, 2, 0, c_white, 1);
}
