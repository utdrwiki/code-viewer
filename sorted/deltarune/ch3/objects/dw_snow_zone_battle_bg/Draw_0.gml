if (!is_active)
    exit;
if (split_screen)
{
    if (bg_sprite_left == -4 || bg_sprite_right == -4)
    {
        if (bg_surface == -4)
            bg_surface = surface_create(camera_get_view_width(0), camera_get_view_height(0));
        surface_set_target(bg_surface);
        draw_set_color(c_black);
        ossafe_fill_rectangle(camerax(), cameray(), view_wport[0], view_hport[0], false);
        draw_set_color(c_white);
        var x_offset = camerax();
        var _xx_offset = 0;
        draw_sprite_ext(spr_dw_snow_zone_bg_parallax_layer_1, 0, x_offset, y_offset + 20, 2, 2, 0, c_white, 1);
        if (i_ex(obj_dw_snow_zone_parallax))
            fountain_speed = obj_dw_snow_zone_parallax.fountain_speed;
        else
            fountain_speed += 0.1;
        draw_sprite_ext(spr_dw_fountain_tall, fountain_speed, x_offset + 246, -120, 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_dw_snow_zone_bg_parallax_layer_2_test, 0, x_offset - 189, y_offset + 20, 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_dw_snow_zone_bg_parallax_layer_3_test, 0, x_offset + 250, y_offset, 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_dw_snow_zone_bg_parallax_layer_4_test, 0, x_offset + 231, y_offset, 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_dw_snow_zone_bg_fountain_hills, 0, x_offset - 289, y_offset - 110, 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_dw_snow_zone_bg_parallax_layer_5_test, 0, x_offset - 449, y_offset - 180, 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_dw_snow_zone_bg_parallax_layer_5_test, 0, x_offset + 191, y_offset - 180, 2, 2, 0, c_white, 1);
        draw_set_color(c_black);
        ossafe_fill_rectangle(camerax(), (cameray() + view_hport[0]) - 40, camerax() + room_width, cameray() + view_hport[0], 0);
        draw_set_color(c_white);
        draw_sprite_ext(spr_cc_fountainbg, fountain_speed, 2370 + _xx_offset, 0, 2, 2, 0, c_white, 1);
        surface_reset_target();
        bg_sprite_left = sprite_create_from_surface(bg_surface, 0, 0, view_wport[0] / 2, view_hport[0], false, true, 0, 0);
        bg_sprite_right = sprite_create_from_surface(bg_surface, view_wport[0] / 2, 0, view_wport[0] / 2, view_hport[0], false, true, 0, 0);
        surface_free(bg_surface);
    }
    if (bg_pos_offset != (view_wport[0] / 2))
        bg_pos_offset = scr_movetowards(bg_pos_offset, view_wport[0] / 2, 15);
    draw_sprite_ext(bg_sprite_left, 0, camerax() - bg_pos_offset, cameray(), 1, 1, 0, c_white, 1);
    draw_sprite_ext(bg_sprite_right, 0, camerax() + (view_wport[0] / 2) + bg_pos_offset, cameray(), 1, 1, 0, c_white, 1);
}
else
{
    var x_offset = camerax();
    var _xx_offset = 0;
    draw_set_color(c_black);
    ossafe_fill_rectangle(camerax(), cameray(), view_wport[0], view_hport[0], false);
    draw_set_color(c_white);
    draw_sprite_ext(spr_dw_snow_zone_bg_parallax_layer_1, 0, x_offset, y_offset + 20, 2, 2, 0, c_white, 1);
    if (i_ex(obj_dw_snow_zone_parallax))
        fountain_speed = obj_dw_snow_zone_parallax.fountain_speed;
    else
        fountain_speed += 0.1;
    draw_sprite_ext(spr_dw_fountain_tall, fountain_speed, x_offset + 245, -120, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_dw_snow_zone_bg_parallax_layer_2_test, 0, x_offset - 189, y_offset + 20, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_dw_snow_zone_bg_parallax_layer_3_test, 0, x_offset + 249, y_offset, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_dw_snow_zone_bg_parallax_layer_4_test, 0, x_offset + 228, y_offset, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_dw_snow_zone_bg_fountain_hills, 0, x_offset - 292, y_offset - 110, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_dw_snow_zone_bg_parallax_layer_5_test, 0, x_offset - 452, y_offset - 180, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_dw_snow_zone_bg_parallax_layer_5_test, 0, x_offset + 188, y_offset - 180, 2, 2, 0, c_white, 1);
    draw_set_color(c_black);
    ossafe_fill_rectangle(camerax(), (cameray() + view_hport[0]) - 40, camerax() + room_width, cameray() + view_hport[0], 0);
    draw_set_color(c_white);
    draw_sprite_ext(spr_cc_fountainbg, fountain_speed, 2370 + _xx_offset, 0, 2, 2, 0, c_white, 1);
}
