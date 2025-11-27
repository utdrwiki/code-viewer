if (current_palette != -4)
{
    pal_swap_set(current_palette, palette_index, false);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
    pal_swap_reset();
}
else
{
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
}
