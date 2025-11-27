draw_set_color(c_black);
draw_set_alpha(shadow_alpha);
draw_ellipse(x - shadow_x_offset, y + shadow_y_offset, x + shadow_x_offset, y + shadow_y_offset + 20, 0);
draw_set_color(c_white);
draw_set_alpha(1);
draw_sprite_ext(spr_dw_tv_gachaball_transparent, 2, x + ballbot_pos_x, y + ballbot_pos_y, 2, 2, 0, c_white, ball_alpha);
draw_sprite_ext(sprite_index, 0, (x - 50) + shake_offset_x, (y - 54) + shake_offset_y, 2, 2, 0, c_white, 1);
draw_sprite_ext(spr_dw_tv_gachaball_transparent, 1, x + balltop_pos_x, y + balltop_pos_x, 2, 2, 0, c_white, ball_top_alpha);
draw_sprite_ext(spr_dw_tv_gachaball_transparent, 3, x + ballcover_pos_x, y + ballcover_pos_y, 2, 2, 0, c_white, ball_alpha);
