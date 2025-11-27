draw_self();
if (headflashtimer > 0)
{
    d3d_set_fog(true, c_white, 0, 1);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 0.3);
    d3d_set_fog(false, c_white, 0, 0);
}
