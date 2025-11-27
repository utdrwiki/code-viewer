if (image_yscale == 2)
{
    draw_self();
}
else
{
    draw_sprite_ext(sprite_index, 0, x, bbox_bottom - 32 - 1, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sprite_index, 0, x, bbox_bottom - 50 - 1, 2, 2, 0, c_white, 1);
}
