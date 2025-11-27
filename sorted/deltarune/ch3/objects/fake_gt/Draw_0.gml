var _xoff = xoffset;
var _yoff = yoffset;
with (obj_growtangle)
{
    draw_sprite_ext(sprite_index, 1, x + _xoff, y + _yoff, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (customBox && growth && growcon != 2)
        draw_sprite_ext(spr_custom_box, 0, x + _xoff, y + _yoff, image_xscale / (maxxscale / 2), image_yscale / (maxyscale / 2), image_angle, image_blend, image_alpha);
    else
        draw_self_offset(_xoff, _yoff);
}
