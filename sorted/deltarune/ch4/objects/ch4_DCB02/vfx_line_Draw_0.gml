if (init < 0)
    exit;
draw_set_alpha(line_alpha);
d_line_width_color(camerax(), y_pos, camerax() + view_wport[0], y_pos, 2, 65280, 65280);
draw_set_alpha(1);
