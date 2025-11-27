draw_set_color(c_white);
if (!surface_exists(surface))
    surface = surface_create(max_width * 2 * surface_scale, height * surface_scale);
surface_set_target(surface);
draw_clear_alpha(c_black, 0);
var _part_height = (height * surface_scale) / parts;
gpu_set_tex_repeat(true);
draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(spr_whirl_texture3, 0));
for (var _p = 0; _p <= parts; _p++)
{
    var _percent = _p / (parts - 1);
    var _pwidth = lerp(min_width, max_width, _percent) * surface_scale;
    var _px = (max_width * surface_scale) + (sin((current_time / (1000 / wave_speed)) + (_percent * wave_length * pi * 2)) * (_pwidth * 0.1));
    var _py = (height * surface_scale) - (_p * _part_height);
    var _yy = (power(1.5 - _percent, 1.5) * 2) + whirl_yoffset;
    draw_vertex_texture_color(_px - (_pwidth / 2), _py, whirl_xoffset - 0.25, _yy, c_white, 1);
    draw_vertex_texture_color(_px + (_pwidth / 2), _py, whirl_xoffset + 0.25, _yy, c_white, 1);
}
draw_primitive_end();
surface_reset_target();
gpu_set_blendmode(bm_add);
draw_surface_ext(surface, x - max_width, y - height, 1 / surface_scale, 1 / surface_scale, 0, #9E7FFF, image_alpha * 0.6);
draw_surface_ext(surface, x - (max_width * 1), (y - height) + 4, 1 / surface_scale, 1 / surface_scale, 0, #7FC2FF, image_alpha * 0.6);
gpu_set_blendmode(bm_normal);
