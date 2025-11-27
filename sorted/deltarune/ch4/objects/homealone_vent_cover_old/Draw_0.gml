for (var i = 0; i < image_yscale; i++)
{
    draw_text(0, i * 10, string(y + (i * sprite_height)));
    draw_sprite_ext(sprite_index, 0, x, y + (i * sprite_get_height(sprite_index)), 1, 1, 0, c_white, 1);
    draw_sprite_ext(sprite_index, 0, x, y + (i * sprite_get_height(sprite_index)), 1, 1, 0, c_black, cover_alpha);
}
