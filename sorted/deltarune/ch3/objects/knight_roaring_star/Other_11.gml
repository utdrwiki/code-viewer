var _xscale = (sprite_width + 16) / sprite_get_width(sprite_index);
var _yscale = (sprite_height + 16) / sprite_get_height(sprite_index);
var _alpha = (sin(timer * 3) + 1) * 0.25;
var _topx = screenx() + (splitease / 2);
var _topy = screeny() + splitease;
var _bottomx = screenx() - (splitease / 2);
var _bottomy = screeny() - splitease;
if (con == 2 || con == 2.5 || con == 3)
{
    var _a = 1;
    var _length = 120;
    if (con == 2)
    {
        _a = clamp01((timer / 30) - _alpha);
        _length = (50 * clamp01((timer / 30) - ((timer % 2) * 0.75))) + 50;
    }
    draw_set_blend_mode(bm_add);
    scr_draw_beam_color(_topx, _topy, _length, 10, 90, c_white, 0, _a, false);
    scr_draw_beam_color(_bottomx, _bottomy, _length, 10, 156, c_white, 0, _a, false);
    scr_draw_beam_color(_topx, _topy, _length, 10, 24, c_white, 0, _a, false);
    scr_draw_beam_color(_bottomx, _bottomy, _length, 10, 270, c_white, 0, _a, false);
    scr_draw_beam_color(_topx, _topy, _length, 10, 336, c_white, 0, _a, false);
    scr_draw_beam_color(_bottomx, _bottomy, _length, 10, 204, c_white, 0, _a, false);
    draw_set_blend_mode(bm_normal);
}
if (con == 1 || con == 2 || con == 2.5)
{
    var _color = merge_color(c_gray, c_red, clamp01(timer / 30));
    draw_sprite_ext(sprite_index, 1, _topx, _topy, _xscale + 0.1, _yscale + 0.1, 0, c_white, _alpha);
    draw_sprite_ext(sprite_index, 0, _topx, _topy, _xscale, _yscale, 0, _color, 1);
    if (split >= 2)
    {
        draw_sprite_ext(spr_knight_bullet_star_bottom, 1, _bottomx, _bottomy, _xscale + 0.1, _yscale + 0.1, 0, c_white, _alpha);
        draw_sprite_ext(spr_knight_bullet_star_bottom, 0, _bottomx, _bottomy, _xscale, _yscale, 0, _color, 1);
    }
}
if (con == 3 || con == 4)
{
    draw_sprite_ext(sprite_index, 2, _topx, _topy, _xscale + 0.1, _yscale + 0.1, 0, c_white, (sin(timer * 6) + 1) * 0.25);
    draw_sprite_ext(sprite_index, 2, _topx, _topy, _xscale, _yscale, 0, c_white, 1);
    if (split >= 2)
    {
        draw_sprite_ext(spr_knight_bullet_star_bottom, 2, _bottomx, _bottomy, _xscale + 0.1, _yscale + 0.1, 0, c_white, (sin(timer * 6) + 1) * 0.25);
        draw_sprite_ext(spr_knight_bullet_star_bottom, 2, _bottomx, _bottomy, _xscale, _yscale, 0, c_white, 1);
    }
}
