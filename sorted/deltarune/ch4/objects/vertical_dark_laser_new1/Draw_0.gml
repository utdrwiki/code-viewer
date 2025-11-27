if (con == 1)
{
    for (i = 0; i < 5; i += 1)
        draw_sprite_ext(spr_vertical_dark_shockwave_square, 2, x + xoffset, (y + yoffset) - (i * 69), laser_xscale, 1, image_angle, image_blend, image_alpha);
}
draw_sprite_ext(sprite_index, image_index, x + xoffset, (y + yoffset) - 360, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x + xoffset, y + yoffset, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (con != 1 && con != 3)
{
    for (i = 0; i < 5; i += 1)
        draw_sprite_ext(spr_vertical_dark_shockwave_square, 0, x + xoffset, (y + yoffset) - (i * 67), laser_xscale, 1, image_angle, image_blend, image_alpha);
}
