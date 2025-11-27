pal_swap_set(spr_tenna_palette, 1, false);
draw_sprite_ext(sprite_index, image_index, x + (shake * polarity), y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
pal_swap_reset();
if (flash)
{
    d3d_set_fog(true, c_yellow, 0, 1);
    draw_sprite_ext(sprite_index, image_index, x + (shake * polarity), y, image_xscale, image_yscale, image_angle, image_blend, flash / 10);
    d3d_set_fog(false, c_black, 0, 0);
}
