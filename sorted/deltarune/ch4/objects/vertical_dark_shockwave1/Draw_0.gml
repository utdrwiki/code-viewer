draw_self();
if (con == 2 || (con == 1 && timer >= 30))
{
    if (position == "below")
    {
        for (i = 0; i < 8; i += 1)
            draw_sprite_ext(spr_vertical_dark_shockwave_square, image_index, x, y - (i * 80) - 3, laser_xscale, 1, image_angle, image_blend, image_alpha);
    }
    if (position == "above")
    {
        for (i = 0; i < 8; i += 1)
            draw_sprite_ext(spr_vertical_dark_shockwave_square, image_index, x, y + 80 + (i * 80) + 3, laser_xscale, 1, image_angle, image_blend, image_alpha);
    }
}
