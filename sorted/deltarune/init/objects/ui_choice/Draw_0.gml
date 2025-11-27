if (!_init)
    exit;
draw_set_color(_color);
draw_set_alpha(_alpha);
draw_set_font(_font);
if (_heart_enabled)
{
    if (_centered)
    {
        var heart_offset = 0;
        if (_font == 1)
            heart_offset = 6;
        draw_sprite_ext(spr_heart, 0, (320 - string_width(_text) - 30) + heart_offset, y + 8, _scale, _scale, 0, c_white, _alpha);
    }
    else
    {
        draw_sprite_ext(spr_heart, 0, x, y + 8, _scale, _scale, 0, c_white, _alpha);
    }
}
if (_font == 1)
    _text_offset = -4;
if (_centered)
{
    if (_font == 1)
        _text_offset = 0;
    draw_set_halign(fa_center);
    draw_text_transformed(320 + _text_offset, y, _text, _scale, _scale, 0);
}
else
{
    draw_set_halign(fa_left);
    draw_text_transformed(x + 30 + _text_offset, y, _text, _scale, _scale, 0);
}
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_alpha(1);
