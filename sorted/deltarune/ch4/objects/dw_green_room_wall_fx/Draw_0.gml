var border_height = 10;
ossafe_fill_rectangle_color(x, y, (x + (image_xscale * 20)) - 1, (y + (image_yscale * 20)) - 1 - border_height, wall_dark, wall_dark, wall_light, wall_light);
if (!sprite_exists(starry_wall_sprite))
{
    var totalwidth = 720 * star_rows;
    var scale = 0.5;
    if (!surface_exists(bg_surface))
        bg_surface = surface_create(totalwidth * scale, 488 * scale);
    surface_set_target(bg_surface);
    draw_clear_alpha(c_black, 0);
    for (var i = 0; i < 12; i++)
    {
        var __x = (xadj + (i * 40)) - 80 - 120;
        var __y = -40 + yadj + (44 * i);
        var amt = __y / 220;
        amt = clamp(amt, 0, 1);
        var colorSet = 16777215;
        var test = -4;
        var alph = 1 - (test / 500);
        for (var j = 0; j < star_rows; j++)
        {
            draw_sprite_ext(spr_dw_green_room_bg_fx_wallrow, 0, (__x + (720 * j)) * scale, __y * scale, 1, 1, 0, colorSet, alph);
            draw_sprite_ext(spr_dw_green_room_bg_fx_wallrow, 0, (__x + 40 + (720 * j)) * scale, __y * scale, 1, 1, 0, colorSet, alph * 0.5);
        }
    }
    surface_reset_target();
    starry_wall_sprite = sprite_create_from_surface(bg_surface, 0, 0, totalwidth * scale, (-40 + yadj + 528) * scale, false, true, 0, 0);
    surface_set_target(bg_surface);
    draw_clear_alpha(c_black, 0);
    scr_draw_sprite_tiled_area(spr_dw_green_room_vines, 0, 0, 0, 0, 0, image_xscale * 10, 16, 1, 1, c_white, 1);
    surface_reset_target();
    vine_sprite = sprite_create_from_surface(bg_surface, 0, 0, image_xscale * 10, 16, false, true, 0, 0);
    surface_free(bg_surface);
}
else
{
    bg_speed -= tile_speed;
    bg_speed_y += tile_speed;
    if (bg_speed < -800)
        bg_speed += 480;
    if (bg_speed_y > -88)
        bg_speed_y -= 88;
    draw_set_alpha(1);
    scr_draw_set_mask(true, true);
    draw_sprite_ext(starry_wall_sprite, 0, x + bg_speed, y + bg_speed_y, 2, 2, 0, c_white, 1);
    scr_draw_in_mask_begin();
    var _light = merge_color(#66839D, #8CB497, 0.4);
    var _dark = merge_color(#66839D, #8CB497, 1);
    ossafe_fill_rectangle_color(x, y, (x + (image_xscale * 20)) - 1, (y + (image_yscale * 20)) - 1 - border_height, _light, _light, _dark, _dark);
    scr_draw_in_mask_end();
    draw_sprite_ext(vine_sprite, 0, x, y, 2, 2, 0, c_white, 1);
}
draw_set_color(#9FD886);
draw_set_alpha(0.3);
ossafe_fill_rectangle(x, (y + (image_yscale * 20)) - border_height, (x + (image_xscale * 20)) - 1, (y + (image_yscale * 20) + 20) - 1);
draw_set_color(c_white);
draw_set_alpha(1);
