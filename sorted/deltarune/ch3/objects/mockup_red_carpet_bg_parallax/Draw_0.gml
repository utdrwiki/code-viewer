y_offset = 0;
var x_offset = camerax();
var x_mod = 0.75;
scr_draw_sprite_tiled_area(spr_mockup_tv_parallax_bg_1, 0, x_offset * x_mod, y_offset, x_offset * x_mod, y_offset, (x_offset * x_mod) + room_width + 200, y_offset + bg_height, 2, 2, c_white, 1);
x_mod = 0.5;
scr_draw_sprite_tiled_area(spr_mockup_tv_parallax_bg_2, 0, x_offset * x_mod, y_offset, x_offset * x_mod, y_offset, (x_offset * x_mod) + room_width + 200, y_offset + bg_height, 2, 2, c_white, 1);
