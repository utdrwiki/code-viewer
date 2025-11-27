draw_set_font(fnt_main);
draw_set_halign(fa_center);
var _xx = x;
var _yy = y;
var _w1_x = _xx + 30;
var _w1_y = _yy + 60;
var _w2_x = _xx + 54;
var _w2_y = _yy + 76;
var _temp = temp + temp2;
var _temp_color;
if (_temp < 50)
    _temp_color = merge_color(c_aqua, c_white, clamp(_temp / 50, 0, 1));
else if (_temp < 80)
    _temp_color = merge_color(c_white, c_yellow, clamp((_temp - 50) / 30, 0, 1));
else
    _temp_color = merge_color(c_yellow, c_red, clamp((_temp - 80) / 40, 0, 1));
draw_sprite_ext(spr_glass_pane, 0, _xx, _yy, 2, 2, 0, c_white, 1);
draw_text_transformed_color(_xx + 27, _yy + 115, _temp, 2, 2, 25, _temp_color, _temp_color, _temp_color, _temp_color, 1);
if (weathersprite == 1035)
    draw_sprite_ext(weathersprite, 0, _w1_x, _w1_y, 2, 2, 0, _temp_color, 1);
if (weathersprite == 2124)
    draw_sprite_ext(weathersprite, 0, _w1_x, _w1_y, -2, 2, 0, _temp_color, 1);
draw_set_alpha(1);
draw_set_halign(fa_left);
var a = 174;
if (vspeed < 0 && y < (cameray() - a))
    y += ((cameraheight() + a) - 12);
if (vspeed > 0 && y > (cameray() + cameraheight()))
    y -= ((cameray() + cameraheight() + a) - 12);
