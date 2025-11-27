draw_self();
if (hurtflashalpha > 0)
{
    d3d_set_fog(true, c_white, 0, 1);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, hurtflashalpha);
    d3d_set_fog(false, c_black, 0, 0);
    hurtflashalpha -= 0.1;
}
