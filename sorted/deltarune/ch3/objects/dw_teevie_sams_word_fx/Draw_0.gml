if (!is_init)
    exit;
if (!sprite_exists(text_sprite))
{
    if (!surface_exists(bg_surface))
        bg_surface = surface_create(camera_get_view_width(0), camera_get_view_height(0));
    surface_set_target(bg_surface);
    draw_clear_alpha(c_black, 0);
    draw_set_color(c_white);
    draw_set_font(scr_84_get_font("main"));
    draw_text_transformed(x, y, current_text, 1, 1, 0);
    surface_reset_target();
    text_sprite = sprite_create_from_surface(bg_surface, x, y, x + string_width(current_text), y + string_height(current_text), false, true, 0, 0);
    sprite_set_offset(text_sprite, sprite_get_width(text_sprite) / 2, sprite_get_height(text_sprite) / 2);
    surface_free(bg_surface);
    if (!surface_exists(outline_surface))
        outline_surface = surface_create(camera_get_view_width(0), camera_get_view_height(0));
    surface_set_target(outline_surface);
    draw_clear_alpha(c_black, 0);
    draw_set_color(c_white);
    var _x_pos = 40;
    var _y_pos = 40;
    draw_text_transformed(_x_pos + 1, _y_pos + 1, current_text, 1, 1, 0);
    draw_text_transformed(_x_pos - 1, _y_pos - 1, current_text, 1, 1, 0);
    draw_text_transformed(_x_pos, _y_pos + 1, current_text, 1, 1, 0);
    draw_text_transformed(_x_pos + 1, _y_pos, current_text, 1, 1, 0);
    draw_text_transformed(_x_pos, _y_pos - 1, current_text, 1, 1, 0);
    draw_text_transformed(_x_pos - 1, _y_pos, current_text, 1, 1, 0);
    draw_text_transformed(_x_pos + 1, _y_pos - 1, current_text, 1, 1, 0);
    draw_text_transformed(_x_pos - 1, _y_pos + 1, current_text, 1, 1, 0);
    surface_reset_target();
    outline_sprite = sprite_create_from_surface(outline_surface, _x_pos - 1, _y_pos - 1, string_width(current_text) + 1, string_height(current_text) + 1, false, true, 0, 0);
    sprite_set_offset(outline_sprite, (sprite_get_width(outline_sprite) / 2) + 1, (sprite_get_height(outline_sprite) / 2) + 1);
    surface_free(outline_surface);
}
else
{
    timer++;
    if (timer == 60)
        fade_out(8);
    if (flashing)
        current_alpha += 0.4;
    draw_sprite_ext(outline_sprite, 0, camerax() + (view_wport[0] / 2), y + 90, 4, 4, 0, current_outline_color, image_alpha + sin(current_alpha));
    if (is_love)
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
    }
    var _offset = (global.lang == "ja") ? -4 : 0;
    draw_sprite_ext(text_sprite, 0, camerax() + (view_wport[0] / 2), y + 90 + _offset, 4, 4, 0, current_color, image_alpha + sin(current_alpha));
    if (is_love)
        shader_reset();
}
