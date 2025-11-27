if (current_palette != -4)
{
    pal_swap_set(current_palette, palette_index, false);
    draw_sprite(sprite_index, image_index, x, y);
    pal_swap_reset();
}
else
{
    draw_sprite(sprite_index, image_index, x, y);
}
