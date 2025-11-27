if (!is_init)
    exit;
if (!sprite_exists(text_sprite))
{
    if (!surface_exists(bg_surface))
        bg_surface = surface_create(camera_get_view_width(0), camera_get_view_height(0));
    surface_set_target(bg_surface);
    draw_clear_alpha(c_black, 0);
    draw_set_color(c_white);
    draw_text_transformed(x, y, current_text, 1, 1, 0);
    surface_reset_target();
    text_sprite = sprite_create_from_surface(bg_surface, x, y, x + string_width(current_text), y + string_height(current_text), false, true, 0, 0);
    sprite_set_offset(text_sprite, sprite_get_width(text_sprite) / 2, sprite_get_height(text_sprite) / 2);
    surface_free(bg_surface);
}
else
{
    shader_set(shd_rainbow);
    _uniUV = shader_get_uniform(shd_rainbow, "u_uv");
    _uniTime = shader_get_uniform(shd_rainbow, "u_time");
    _uniSpeed = shader_get_uniform(shd_rainbow, "u_speed");
    _time -= bonus_color_speed;
    var uv = sprite_get_uvs(text_sprite, 0);
    shader_set_uniform_f(_uniUV, uv[0], uv[2]);
    shader_set_uniform_f(_uniSpeed, _speed);
    shader_set_uniform_f(_uniTime, _time);
    uv = sprite_get_uvs(text_sprite, 0);
    shader_set_uniform_f(_uniUV, uv[0], uv[2]);
    shader_set_uniform_f(_uniSpeed, _speed);
    shader_set_uniform_f(_uniTime, _time);
    siner++;
    draw_sprite_ext(text_sprite, 0, x + 290, y + 80, 4 + abs(sin(siner / 8)), 4, sin(siner / 8) * 4, c_white, 1);
    shader_reset();
}
