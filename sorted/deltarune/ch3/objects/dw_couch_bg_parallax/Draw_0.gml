var x_offset = camerax();
scr_draw_sprite_tiled_area(spr_dw_couch_bg_parallax_layer_2, 0, x_offset * 0.9, y_offset, x_offset * 0.9, y_offset, (x_offset * 0.9) + room_width + 200, y_offset + bg_height, 2, 2, c_white, 1);
scr_draw_sprite_tiled_area(spr_dw_couch_bg_parallax_layer_3, 0, x_offset * 0.6, y_offset, x_offset * 0.6, y_offset, (x_offset * 0.6) + room_width + 200, y_offset + bg_height, 2, 2, c_white, 1);
scr_draw_sprite_tiled_area(spr_dw_couch_bg_parallax_layer_4, 0, x_offset * 0.25, y_offset, x_offset * 0.25, y_offset, (x_offset * 0.25) + room_width + 200, y_offset + bg_height, 2, 2, c_white, 1);
if (room != room_dw_couch_overworld_01 && room != room_dw_couch_overworld_03)
{
    draw_set_color(c_black);
    ossafe_fill_rectangle(0, 280, room_width, cameray() + view_hport[0], false);
    draw_set_color(c_white);
}
for (var i = 0; i < 6; i++)
{
    draw_set_alpha(i / 6);
    draw_set_color(c_black);
    ossafe_fill_rectangle(0, ((y_offset + bg_height) - 40) + (i * 30), room_width, cameray() + view_hport[0], false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}
