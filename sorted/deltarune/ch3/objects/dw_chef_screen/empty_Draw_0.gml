if (con < 0)
    exit;
draw_sprite_ext(spr_dw_kitchen, 0, 0, 0, 2, 2, 0, c_white, 1);
crttimer = (crttimer + 0.5) % 3;
var _vig = crt_glitch ? (0.2 + random(clamp(crt_glitch / 200, 0, 0.1))) : 0;
var _vigint = power(1.5, 1.5 - _vig) * 18;
var _chrom_scale = crt_glitch ? (irandom_range(-4, 4) * clamp(crt_glitch / 5, 1, 5)) : chromStrength;
if (_chrom_scale == 0)
    _chrom_scale = 1;
var _filteramount = 0.1 + min(crt_glitch / 100, 0.1);
shader_set(shd_crt);
shader_set_uniform_f(shader_get_uniform(shd_crt, "texel"), 1 / screenwidth, 1 / screenheight);
shader_set_uniform_f(shader_get_uniform(shd_crt, "vignette_scale"), _vig);
shader_set_uniform_f(shader_get_uniform(shd_crt, "vignette_intensity"), _vigint);
shader_set_uniform_f(shader_get_uniform(shd_crt, "chromatic_scale"), _chrom_scale);
shader_set_uniform_f(shader_get_uniform(shd_crt, "filter_amount"), _filteramount);
shader_set_uniform_f(shader_get_uniform(shd_crt, "time"), crttimer);
draw_set_color(c_white);
ossafe_fill_rectangle(_x_pos, _y_pos, _x_pos + (_x_width * _progress), _y_pos + _y_height, false);
draw_set_color(c_white);
if (countdown)
{
    countdown_timer++;
    if ((countdown_timer % 30) == 0)
    {
        countdown_text = clamp(countdown_text - 1, 1, 3);
        if (countdown_text <= 1 && !countdown_finished)
        {
            countdown_finished = true;
            scr_var_delay("countdown", false, 30);
        }
    }
    draw_set_color(c_black);
    draw_set_font(fnt_main);
    draw_set_halign(fa_center);
    draw_text_ext_transformed(_x_pos + 200, _y_pos + 60, string(countdown_text), 4, 9999, 6, 6, 0);
    draw_set_halign(fa_left);
    draw_set_color(c_white);
}
shader_reset();
draw_sprite_ext(spr_dw_kitchen_wall, 0, 0, 0, 2, 2, 0, c_white, 1);
