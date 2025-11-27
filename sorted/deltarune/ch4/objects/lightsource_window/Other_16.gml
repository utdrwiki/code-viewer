var _xx = screenx();
var _yy = screeny();
if (wall)
{
    draw_sprite_ext(sprite_index, 0, _xx, _yy, image_xscale, image_yscale, image_angle, image_blend, 1);
}
else
{
    draw_set_blend_mode(bm_subtract);
    d3d_set_fog(true, c_white, 0, 1);
    draw_sprite_ext(sprite_index, 2, _xx, _yy, image_xscale, image_yscale, image_angle, image_blend, 1);
    d3d_set_fog(false, c_white, 0, 0);
    draw_set_blend_mode(bm_normal);
}
