if (instance_exists(546 && con == 0))
    exit;
var _xscale = (sprite_width + 16) / sprite_get_width(sprite_index);
var _yscale = (sprite_height + 16) / sprite_get_height(sprite_index);
var _color = merge_color(c_gray, c_red, clamp01(timer / 30));
var _alpha = (sin(timer * 3) + 1) * 0.25;
if (con == 2 || con == 3)
{
    var _a = 1;
    var _length = 120;
    var _prog = clamp01(timer / 30);
    if (con == 2)
    {
        _a = clamp01(_prog - _alpha);
        _length = (50 * clamp01(_prog - ((timer % 2) * 0.75))) + 50;
    }
    var _offset = 66;
    var _sublength = (difficulty >= 1) ? _length : (_length / 2);
    draw_set_blend_mode(bm_add);
    var _beamcolor = (difficulty >= 2) ? _color : 16777215;
    if (difficulty == 2)
    {
        _prog = scr_ease_in(clamp01(timer / 20), 4);
        if (con == 3)
            _offset = 5;
        else
            _offset = lerp(66, 5, _prog);
        _beamcolor = _color;
        if (timer >= 30)
        {
            _prog = scr_ease_in(clamp01((timer - 30) / 10), 4);
            _length += (50 - (_prog * 50));
        }
        scr_draw_beam_color(x, y, _length, 10, 90 + side, _beamcolor, 0, _a, false);
        scr_draw_beam_color(x, y, _length, 10, -90 + side, _beamcolor, 0, _a, false);
        scr_draw_beam_color(x, y, _sublength, 10, 90 + side + _offset, _beamcolor, 0, _a, false);
        scr_draw_beam_color(x, y, _sublength, 10, (90 + side) - _offset, _beamcolor, 0, _a, false);
        scr_draw_beam_color(x, y, _sublength, 10, -90 + side + _offset, _beamcolor, 0, _a, false);
        scr_draw_beam_color(x, y, _sublength, 10, (-90 + side) - _offset, _beamcolor, 0, _a, false);
    }
    else
    {
        scr_draw_beam_color(x, y, _length, 10, 90, _beamcolor, 0, _a, false);
        if (difficulty != 2)
        {
            scr_draw_beam_color(x, y, _sublength, 10, 156, c_white, 0, _a, false);
            scr_draw_beam_color(x, y, _sublength, 10, 24, c_white, 0, _a, false);
            scr_draw_beam_color(x, y, _sublength, 10, 270, c_white, 0, _a, false);
        }
        scr_draw_beam_color(x, y, _length, 10, 336, _beamcolor, 0, _a, false);
        scr_draw_beam_color(x, y, _length, 10, 204, _beamcolor, 0, _a, false);
    }
    draw_set_blend_mode(bm_normal);
}
if (con == 1 || con == 2)
{
    draw_sprite_ext(sprite_index, 1, x, y, _xscale + 0.1, _yscale + 0.1, image_angle, c_white, _alpha);
    draw_sprite_ext(sprite_index, 0, x, y, _xscale, _yscale, image_angle, _color, 1);
}
if (con == 3 || con == 4)
{
    draw_sprite_ext(sprite_index, 2, x, y, _xscale + 0.1, _yscale + 0.1, image_angle, c_white, (sin(timer * 6) + 1) * 0.25);
    draw_sprite_ext(sprite_index, 2, x, y, _xscale, _yscale, image_angle, c_white, 1);
}
