if (scr_isphase("menu"))
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
        _xx = 202 + (78 * _f);
        _yy = 100 - (10 * _f);
        _yy += (sin((current_time / 200) + _f) * 2);
        draw_sprite_ext(spr_glass_pane, 0, _xx, _yy, 2, 2, 0, c_white, forecast_alpha);
        var _temp = _forecast[0];
        var _temp_color;
        if (_temp < 50)
            _temp_color = merge_color(c_aqua, c_white, clamp(_temp / 50, 0, 1));
        else if (_temp < 80)
            _temp_color = merge_color(c_white, c_yellow, clamp((_temp - 50) / 30, 0, 1));
        else
            _temp_color = merge_color(c_yellow, c_red, clamp((_temp - 80) / 40, 0, 1));
        if (use_celsius)
            _temp = round((_temp - 32) * 0.5556);
        draw_text_transformed_color(_xx + 27, _yy + 115, _temp, 2, 2, 25, _temp_color, _temp_color, _temp_color, _temp_color, forecast_alpha);
        var _w1_x = (_xx + 24) - 10;
        var _w1_y = _yy + 36;
        var _w2_x = _xx + 44 + 10;
        var _w2_y = _yy + 76;
        var _lanino_scale = 2;
        var _elnina_scale = 2;
        draw_sprite_ext(_forecast_lanino, 0, _w1_x, _w1_y, _lanino_scale, _lanino_scale, 0, c_white, forecast_alpha);
        draw_sprite_ext(_forecast_elnina, 0, _w2_x, _w2_y, _elnina_scale, _elnina_scale, 0, c_white, forecast_alpha);
    }
    draw_set_alpha(1);
    draw_set_halign(fa_left);
}
if (global.fighting == 0)
{
    debug_print("battle over");
    mus_volume(global.batmusic[1], 0, 60);
    mus_volume(global.currentsong[1], 0, 0);
    snd_resume(global.currentsong[1]);
    mus_volume(global.currentsong[1], 1, 60);
    safe_delete(tenna);
    instance_destroy();
}
