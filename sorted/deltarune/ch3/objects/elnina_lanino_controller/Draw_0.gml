if (digit_flash_timer > 0)
    digit_flash_timer--;
if (scr_isphase("menu") || scr_isphase("acting") || ilovetv_increase == 99)
    digit_alpha = scr_movetowards(digit_alpha, 1, 0.1);
else
    digit_alpha = scr_movetowards(digit_alpha, 0, 0.1);
if (digit_alpha > 0)
{
    var _first_digit = ilovetv div 10;
    var _second_digit = ilovetv % 10;
    var _col_factor = sin((digit_flash_timer / digit_flash_duration) * pi);
    var _col2 = merge_color(c_red, c_white, 0.5);
    if (ballooncon == 26)
        _col2 = merge_color(c_red, c_white, 0.25);
    var _col = merge_color(c_red, _col2, _col_factor);
    if (ilovetv == 99)
    {
        _col_factor = (sin(current_time / 30) * 0.15) + 0.5;
        _col = merge_color(c_orange, c_yellow, _col_factor);
    }
    var _xx = 280;
    var _yy = 20;
    draw_sprite_ext(spr_tv_counter_numbers, _first_digit, _xx, _yy, 2, 2, 0, _col, digit_alpha);
    draw_sprite_ext(spr_tv_counter_numbers, _second_digit, _xx + 40, _yy, 2, 2, 0, _col, digit_alpha);
}
if (intro >= 4 && scr_isphase("menu"))
    forecast_alpha = scr_movetowards(forecast_alpha, 1, 0.1);
else
    forecast_alpha = scr_movetowards(forecast_alpha, 0, 0.1);
if (forecast_alpha > 0)
{
    draw_set_font(fnt_main);
    draw_set_halign(fa_center);
    for (var _f = 0; _f < array_length(forecasts); _f++)
    {
        var _forecast = forecasts[_f];
        var _forecast_lanino = _forecast[1];
        var _forecast_elnina = _forecast[2];
        var _xx = 202 + (78 * _f);
        var _yy = 100 - (10 * _f);
        _yy += (sin((current_time / 200) + _f) * 2);
        draw_sprite_ext(spr_glass_pane, 0, _xx, _yy, 2, 2, 0, c_white, forecast_alpha);
        var _temp = _forecast[0];
        var _temp_color;
        if (forecast_turn == 6)
        {
            _temp = (lastchosen == "lanino") ? 999 : -999;
            _temp_color = (lastchosen == "lanino") ? merge_color(c_red, c_orange, (sin(current_time / 100) * 0.5) + 0.5) : merge_color(c_aqua, c_blue, (sin(current_time / 100) * 0.25) + 0.25);
        }
        else
        {
            if (_temp < 50)
                _temp_color = merge_color(c_aqua, c_white, clamp(_temp / 50, 0, 1));
            else if (_temp < 80)
                _temp_color = merge_color(c_white, c_yellow, clamp((_temp - 50) / 30, 0, 1));
            else
                _temp_color = merge_color(c_yellow, c_red, clamp((_temp - 80) / 40, 0, 1));
            if (use_celsius)
                _temp = round((_temp - 32) * 0.5556);
        }
        draw_text_transformed_color(_xx + 27, _yy + 115, _temp, 2, 2, 25, _temp_color, _temp_color, _temp_color, _temp_color, forecast_alpha);
        var _w1_x = (_xx + 24) - 10;
        var _w1_y = _yy + 36;
        var _w2_x = _xx + 44 + 10;
        var _w2_y = _yy + 76;
        if (forecast_turn == 6)
        {
            if (lastchosen == "lanino")
            {
                draw_sprite_ext(spr_weather_sun, 0, _w1_x + irandom(2), _w1_y + irandom(2), 3, 3, 0, c_white, forecast_alpha);
                draw_sprite_ext(spr_weather_sun, 0, _w2_x + irandom(2), _w1_y + irandom(2), 3, 3, 0, c_white, forecast_alpha);
                draw_sprite_ext(spr_weather_sun, 0, _w1_x + irandom(2), _w2_y + irandom(2), 3, 3, 0, c_white, forecast_alpha);
                draw_sprite_ext(spr_weather_sun, 0, _w2_x + irandom(2), _w2_y + irandom(2), 3, 3, 0, c_white, forecast_alpha);
            }
            else
            {
                draw_sprite_ext(spr_weather_snow, 0, _w1_x + irandom(2), _w1_y + irandom(2), 3, 3, 0, c_white, forecast_alpha);
                draw_sprite_ext(spr_weather_snow, 0, _w2_x + irandom(2), _w1_y + irandom(2), 3, 3, 0, c_white, forecast_alpha);
                draw_sprite_ext(spr_weather_snow, 0, _w1_x + irandom(2), _w2_y + irandom(2), 3, 3, 0, c_white, forecast_alpha);
                draw_sprite_ext(spr_weather_snow, 0, _w2_x + irandom(2), _w2_y + irandom(2), 3, 3, 0, c_white, forecast_alpha);
            }
        }
        else
        {
            var _lanino_scale = 2;
            var _elnina_scale = 2;
            if (forecast_turn >= 3)
            {
                if (lastchosen == "lanino")
                {
                    _w1_x += (1 - irandom(2));
                    _w1_y += (1 - irandom(2));
                    _lanino_scale = 2 + ((forecast_turn - 2) * 1);
                    _elnina_scale = 2;
                }
                else
                {
                    _w2_x += (1 - irandom(2));
                    _w2_y += (1 - irandom(2));
                    _lanino_scale = 2;
                    _elnina_scale = 2 + ((forecast_turn - 2) * 1);
                }
            }
            draw_sprite_ext(_forecast_lanino, 0, _w1_x, _w1_y, _lanino_scale, _lanino_scale, 0, c_white, forecast_alpha);
            draw_sprite_ext(_forecast_elnina, 0, _w2_x, _w2_y, _elnina_scale, _elnina_scale, 0, c_white, forecast_alpha);
        }
    }
    draw_set_alpha(1);
    draw_set_halign(fa_left);
}
if (global.fighting == 0)
{
    debug_print("battle over");
    mus_volume(global.batmusic[1], 0, 60);
    mus_volume(global.currentsong[1], 0, 0);
    safe_delete(tenna);
    instance_destroy();
}
