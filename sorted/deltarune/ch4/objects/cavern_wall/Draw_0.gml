var _vol = obj_mike_controller.microphone_volume / 100;
var _xend = x + lengthdir_x(image_xscale, image_angle);
var _yend = y + lengthdir_y(image_xscale, image_angle);
if (_xend > 0 && x < room_width)
{
    if (next == -1)
    {
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, image_angle, image_blend, image_alpha);
    }
    else
    {
        image_blend = merge_colour(c_black, c_gray, fade);
        if (obj_mike_minigame_controller.wave > 1)
            fade = scr_approach(fade, 1, 0.1);
        draw_set_colour(merge_colour(image_blend, c_blue, _vol));
        if (_vol > 0.1)
        {
            var _lines = 11;
            var _xx = x;
            var _yy = y;
            var _xx2 = _xx;
            var _yy2 = _yy;
            var _w = image_xscale / _lines;
            for (var _i = 0; _i < _lines; _i++)
            {
                _xx = _xx2 + lengthdir_x(_w, image_angle);
                _yy = _yy2 + lengthdir_y(_w, image_angle) + (sin(_i + (current_time / 60)) * _vol * 12 * sign(image_yscale));
                if (i_ex(next) && _i == (_lines - 1))
                {
                    _xx = next.x;
                    _yy = next.y;
                }
                d_line(_xx, _yy, _xx2, _yy2);
                _xx2 = _xx;
                _yy2 = _yy;
            }
        }
        else
        {
            d_line(x, y, _xend, _yend);
        }
    }
}
