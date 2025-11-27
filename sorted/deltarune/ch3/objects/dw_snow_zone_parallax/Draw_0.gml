var x_offset = camerax();
if (camerax() >= 1320)
    x_offset = 1320;
scr_draw_sprite_tiled_area(spr_dw_snow_zone_bg_parallax_layer_1, 0, x_offset, y_offset + 20, x_offset * 0.9, y_offset + 20, (x_offset * 0.9) + room_width + 200, y_offset + 20 + bg_height, 2, 2, c_white, 1);
if (camerax() >= 860)
{
    fountain_speed += 0.1;
    if (camerax() >= 2100)
        draw_sprite_ext(spr_dw_fountain_tall, fountain_speed, 2200, -120, 2, 2, 0, c_white, 1);
    else
        draw_sprite_ext(spr_dw_fountain_tall, fountain_speed, ((x_offset * 0.95) + 300) - 1, -120, 2, 2, 0, c_white, 1);
}
scr_draw_sprite_tiled_area(spr_dw_snow_zone_bg_parallax_layer_2_test, 0, (x_offset * 0.9) - 40, y_offset + 20, x_offset * 0.9, y_offset + 20, (x_offset * 0.9) + room_width + 200, y_offset + 20 + bg_height, 2, 2, c_white, 1);
scr_draw_sprite_tiled_area(spr_dw_snow_zone_bg_parallax_layer_3_test, 0, x_offset * 0.6, y_offset, x_offset * 0.6, y_offset, (x_offset * 0.6) + room_width + 200, y_offset + bg_height, 2, 2, c_white, 1);
scr_draw_sprite_tiled_area(spr_dw_snow_zone_bg_parallax_layer_4_test, 0, 40, y_offset, 0, y_offset, room_width, y_offset + bg_height, 2, 2, c_white, 1);
draw_sprite_ext(spr_dw_snow_zone_bg_fountain_hills, 0, 570, y_offset - 40, 2, 2, 0, c_white, 1);
draw_sprite_ext(spr_dw_snow_zone_bg_fountain_hills, 0, 800, y_offset - 110, 2, 2, 0, c_white, 1);
scr_draw_sprite_tiled_area(spr_dw_snow_zone_bg_parallax_layer_5_test, 0, 0, y_offset - 180, 0, y_offset - 180, room_width, (y_offset - 180) + bg_height, 2, 2, c_white, 1);
draw_sprite_ext(spr_dw_snow_zone_end, 0, 1998, y_offset - 66, 2, 2, 0, c_white, 1);
draw_set_color(c_black);
ossafe_fill_rectangle(2600, cameray(), room_width * 2, cameray() + view_hport[0], 0);
draw_set_color(c_white);
draw_sprite_ext(spr_cc_fountainbg, fountain_speed, 2370, 0, 2, 2, 0, c_white, 1);
draw_set_alpha(1);
draw_set_color(c_black);
gpu_set_blendmode(bm_subtract);
ossafe_fill_rectangle_color(120, 0, 320, 480, c_white, c_black, c_black, c_white, 0);
ossafe_fill_rectangle_color(120 - (camerax() * 4), 0, 1000, 480, c_white, c_black, c_black, c_white, 0);
gpu_set_blendmode(bm_normal);
