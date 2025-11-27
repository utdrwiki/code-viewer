var _x = x;
var _y = y;
if (offset_origin)
{
    _x += (left * image_xscale);
    _y += (top * image_yscale);
}
draw_sprite_part_ext(sprite_index, image_index, left, top, width, height, _x, _y, image_xscale, image_yscale, image_blend, image_alpha);
