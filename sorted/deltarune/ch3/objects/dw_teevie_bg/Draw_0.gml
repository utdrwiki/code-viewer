var max_y = room_height;
var middle_pos = 80;
ossafe_fill_rectangle_color(0, 0, room_width, middle_pos, c_black, c_black, #24265E, #24265E, false);
ossafe_fill_rectangle_color(0, middle_pos, room_width, max_y, #24265E, #24265E, c_black, c_black, false);
bg_speed -= (bg_speed_max * 0.4);
bg_speed_y += (bg_speed_y_max * 0.4);
if (bg_speed < -640)
    bg_speed += 640;
if (bg_speed_y > -480)
    bg_speed_y -= 480;
var x_offset = camerax();
draw_sprite_tiled_ext(spr_dw_teevie_bg_star_01_tile, 0, (x_offset * 0.8) + (bg_speed * 0.5), cameray() + (bg_speed_y * 0.5), 2, 2, merge_color(#24265E, c_black, 0.5), 0.6);
draw_sprite_tiled_ext(spr_dw_teevie_bg_star_02_tile, 0, (x_offset * 0.8) + (bg_speed * 0.5), cameray() + (bg_speed_y * 0.5) + 20, 2, 2, #24265E, 0.5);
draw_sprite_tiled_ext(spr_dw_teevie_bg_star_01_tile, 0, (x_offset * 0.6) + bg_speed, cameray() + bg_speed_y, 2, 2, merge_color(#24265E, #090916, 0.2), 1);
draw_sprite_tiled_ext(spr_dw_teevie_bg_star_02_tile, 0, (x_offset * 0.6) + bg_speed, cameray() + bg_speed_y + 20, 2, 2, merge_color(#24265E, #090916, 0.7), 1);
draw_sprite_tiled_ext(spr_dw_teevie_bg_star_03_tile, 0, (x_offset * 0.6) + bg_speed, cameray() + bg_speed_y, 2, 2, merge_color(#24265E, c_blue, 0.2), 0.6);
draw_sprite_tiled_ext(spr_dw_teevie_bg_star_03_tile, 0, (x_offset * 0.6) + bg_speed + 40, cameray() + bg_speed_y + 20, 2, 2, merge_color(#24265E, #090916, 0.1), 1);
draw_set_alpha(0.5);
ossafe_fill_rectangle_color(0, 0, room_width, max_y, #24265E, #24265E, c_black, c_black, false);
draw_set_alpha(1);
if (!sprite_exists(girder_sprite[0]))
{
    if (!surface_exists(bg_surface))
        bg_surface = surface_create(room_width / 2, room_height / 2);
    surface_set_target(bg_surface);
    draw_clear_alpha(c_black, 0);
    var _girder_height = room_height / 2 / 18;
    var _girder_width = room_width / 2 / 340;
    for (var i = 0; i < _girder_width; i++)
    {
        for (var j = 0; j < _girder_height; j++)
        {
            var x_pos = 40 + (i * 300);
            draw_sprite_ext(spr_dw_teevie_bg_girder_tile, 0, x_pos, j * 18, 1, 1, 0, merge_color(#1E1B27, c_black, 0.15), 1);
        }
    }
    surface_reset_target();
    girder_sprite[0] = sprite_create_from_surface(bg_surface, 0, 0, room_width / 2, room_height / 2, false, true, 0, 0);
    surface_set_target(bg_surface);
    draw_clear_alpha(c_black, 0);
    _girder_height = room_height / 2 / 30;
    _girder_width = room_width / 2 / 190;
    for (var i = 0; i < _girder_width; i++)
    {
        for (var j = 0; j < _girder_height; j++)
        {
            var x_pos = 20 + (i * 170);
            draw_sprite_ext(spr_dw_teevie_bg_girder_medium_tile, 0, x_pos, j * 30, 1, 1, 0, merge_color(#1E1B27, c_black, 0.15), 1);
        }
    }
    surface_reset_target();
    girder_sprite[1] = sprite_create_from_surface(bg_surface, 0, 0, room_width / 2, room_height / 2, false, true, 0, 0);
    surface_set_target(bg_surface);
    draw_clear_alpha(c_black, 0);
    _girder_height = room_height / 2 / 76;
    _girder_width = room_width / 2 / 430;
    for (var i = 0; i < _girder_width; i++)
    {
        for (var j = 0; j < _girder_height; j++)
        {
            var x_pos = 50 + (i * 380);
            draw_sprite_ext(spr_dw_teevie_bg_girder_large_tile, 0, x_pos, j * 76, 1, 1, 0, merge_color(#1E1B27, c_black, 0.75), 1);
        }
    }
    surface_reset_target();
    girder_sprite[2] = sprite_create_from_surface(bg_surface, 0, 0, room_width / 2, room_height / 2, false, true, 0, 0);
    surface_set_target(bg_surface);
    draw_clear_alpha(c_black, 0);
    _girder_height = room_height / 2 / 10;
    _girder_width = room_width / 2 / 290;
    for (var i = 0; i < _girder_width; i++)
    {
        for (var j = 0; j < _girder_height; j++)
        {
            var x_pos = 100 + (i * 190);
            draw_sprite_ext(spr_dw_teevie_bg_girder_small_tile, 0, x_pos, j * 10, 1, 1, 0, merge_color(#1E1B27, c_black, 0.6), 1);
        }
    }
    surface_reset_target();
    girder_sprite[3] = sprite_create_from_surface(bg_surface, 0, 0, room_width / 2, room_height / 2, false, true, 0, 0);
    surface_set_target(bg_surface);
    draw_clear_alpha(c_black, 0);
    _girder_width = room_width / 2 / sprite_get_width(spr_dw_teevie_bg_girder_lights);
    for (var i = 0; i < _girder_width; i++)
        draw_sprite_ext(spr_dw_teevie_bg_girder_lights, 0, i * sprite_get_width(spr_dw_teevie_bg_girder_lights), 0, 1, 1, 0, c_white, 1);
    surface_reset_target();
    girder_sprite[4] = sprite_create_from_surface(bg_surface, 0, 0, room_width / 2, sprite_get_height(spr_dw_teevie_bg_girder_lights), false, true, 0, 0);
    surface_free(bg_surface);
}
else
{
    draw_sprite_ext(girder_sprite[0], 0, x_offset * 0.5, 0, 2, 2, 0, c_white, 1);
    draw_sprite_ext(girder_sprite[1], 0, x_offset * 0.6, 0, 2, 2, 0, c_white, 1);
    draw_sprite_ext(girder_sprite[2], 0, x_offset * 0.4, 0, 2, 2, 0, c_white, 1);
    draw_sprite_ext(girder_sprite[3], 0, x_offset * 0.3, 0, 2, 2, 0, c_white, 1);
    draw_sprite_ext(girder_sprite[4], 0, 0, 0, 2, 2, 0, c_white, 1);
}
