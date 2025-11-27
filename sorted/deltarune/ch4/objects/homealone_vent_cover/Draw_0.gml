if (!horizontal)
{
    for (var i = 0; i < image_yscale; i++)
    {
        draw_sprite_ext(sprite_index, 0, x, y + (i * sprite_get_height(sprite_index)), 1, 1, 0, c_white, 1);
        draw_sprite_ext(sprite_index, 0, x, y + (i * sprite_get_height(sprite_index)), 1, 1, 0, c_black, cover_alpha);
    }
}
else
{
    for (var i = 0; i < image_xscale; i++)
    {
        draw_sprite_ext(bg_noellehouse_vents_tile_h, 0, x + (i * sprite_get_width(bg_noellehouse_vents_tile_h)), y, 1, 1, 0, c_white, 1);
        draw_sprite_ext(bg_noellehouse_vents_tile_h, 0, x + (i * sprite_get_width(bg_noellehouse_vents_tile_h)), y, 1, 1, 0, c_black, cover_alpha);
    }
}
