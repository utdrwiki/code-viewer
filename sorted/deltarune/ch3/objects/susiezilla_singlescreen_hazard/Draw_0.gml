draw_sprite_ext(spr_susiezilla_shadowSpot, 0, x - 12, y + 60, 1, 1, 0, c_black, 0.5);
if (friendly)
{
    var wave = global.time % 10;
    d3d_set_fog(true, merge_color(c_orange, c_yellow, 0.5), 0, 0);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale + (wave / 5), image_yscale + (wave / 5), draw_angle, image_blend, image_alpha - (wave / 10));
    d3d_set_fog(true, c_yellow, 0, 0);
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, draw_angle, image_blend, image_alpha);
if (friendly)
    d3d_set_fog(false, c_black, 0, 0);
