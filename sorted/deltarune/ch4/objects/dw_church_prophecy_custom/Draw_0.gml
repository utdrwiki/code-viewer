if (!init)
    exit;
if (!sprite_exists(custom_sprite))
{
    if (!surface_exists(bg_surface))
        bg_surface = surface_create(320, 240);
    surface_set_target(bg_surface);
    draw_clear_alpha(c_black, 0);
    draw_set_color(c_white);
    ossafe_fill_rectangle(0, 0, 320, 240, false);
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(false, false, false, true);
    gpu_set_blendmode_ext(bm_inv_dest_alpha, bm_zero);
    gpu_set_alphatestenable(true);
    draw_set_alpha(1);
    if (mode == 0)
    {
        draw_sprite(sprite_mask, 0, 99.5, 122);
    }
    else if (mode == 1)
    {
        var font_cache = draw_get_font();
        draw_set_color(c_white);
        draw_set_font(scr_84_get_font("legend_alt"));
        for (var i = 0; i < array_length(sprite_string); i++)
        {
            var _text_x_offset = floor(160 - (string_width(sprite_string[i]) / 2)) - (string_length(sprite_string[i]) / 2);
            _text_x_offset = floor(_text_x_offset);
            var y_offset_lang = (global.lang == "ja") ? 1 : -1;
            var y_offset = (16 / array_length(sprite_string)) + y_offset_lang;
            draw_text_kern_legend(_text_x_offset, y_offset + (i * 16), sprite_string[i], 1);
        }
        draw_set_font(font_cache);
    }
    gpu_set_alphatestenable(false);
    gpu_set_blendmode(bm_normal);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
    gpu_set_alphatestenable(true);
    gpu_set_alphatestenable(false);
    gpu_set_blendmode(bm_normal);
    surface_reset_target();
    if (mode == 0)
    {
        custom_sprite = sprite_create_from_surface(bg_surface, 0, 0, 199, 124, false, false, 0, 0);
        sprite_set_offset(custom_sprite, sprite_get_width(custom_sprite) / 2, sprite_get_height(custom_sprite) / 2);
    }
    else if (mode == 1)
    {
        custom_sprite = sprite_create_from_surface(bg_surface, 0, 0, 320, 124, false, false, 0, 0);
    }
    surface_free(bg_surface);
}
else
{
}
