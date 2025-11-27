var _xscale = (sprite_width + 16) / sprite_get_width(sprite_index);
var _yscale = (sprite_height + 16) / sprite_get_height(sprite_index);
if (split < 2)
{
    draw_sprite_ext(sprite_index, 0, screenx(), screeny(), _xscale, _yscale, image_angle, image_blend, image_alpha);
}
else
{
    draw_sprite_ext(spr_knight_bullet_star_top, 0, screenx() + (splitease / 2), screeny() + splitease, _xscale, _yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_knight_bullet_star_bottom, 0, screenx() - (splitease / 2), screeny() - splitease, _xscale, _yscale, image_angle, image_blend, image_alpha);
}
