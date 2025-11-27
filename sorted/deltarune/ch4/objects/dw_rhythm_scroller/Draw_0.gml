if (!init)
    exit;
draw_set_alpha(banner_alpha);
yy = cameray() + target_ypos;
ossafe_fill_rectangle_color(camerax(), yy - 2, camerax() + view_wport[0], yy, c_yellow, c_yellow, c_yellow, c_yellow, 0);
ossafe_fill_rectangle_color(camerax(), yy, camerax() + view_wport[0], yy + margin_top + 40, c_black, c_black, c_black, c_black, 0);
ossafe_fill_rectangle_color(camerax(), yy + margin_top + 40, camerax() + view_wport[0], yy + margin_top + 40 + 1, c_yellow, c_yellow, c_yellow, c_yellow, 0);
draw_set_color(c_yellow);
draw_set_font(scr_84_get_font("mainbig"));
text_x_pos[0] += text_speed;
if (text_x_pos[0] < -string_width(scrolling_text))
    text_x_pos[0] = text_x_pos[1] + string_width(scrolling_text);
text_x_pos[1] += text_speed;
if (text_x_pos[1] < -string_width(scrolling_text))
    text_x_pos[1] = text_x_pos[0] + string_width(scrolling_text);
draw_text_ext_transformed(camerax() + text_x_pos[0], yy + margin_top, scrolling_text, 999, 9999, 1, 1, 0);
draw_text_ext_transformed(camerax() + text_x_pos[1], yy + margin_top, scrolling_text, 999, 9999, 1, 1, 0);
draw_set_color(c_white);
draw_set_alpha(1);
