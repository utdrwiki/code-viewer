draw_self();
scr_draw_in_box_ext_begin(-4, -4);
with (obj_regularbullet)
    draw_self();
with (obj_knight_streamline)
{
    line_length = scr_approach(line_length, 400, 60);
    width = scr_approach(width, width_goal, min(abs(width_goal - width) * 0.5, 16));
    x1 = x + lengthdir_x(200, direction);
    y1 = y + lengthdir_y(200, direction);
    x2 = x1 + lengthdir_x(line_length, direction + 180);
    y2 = y1 + lengthdir_y(line_length, direction + 180);
    draw_line_width_color(x1, y1, x2, y2, width, c_gray, c_gray);
}
with (obj_bullet_knight_stream)
{
    line_length = scr_approach(line_length, 400, 60);
    width = scr_approach(width, width_goal, min(abs(width_goal - width) * 0.5, 16));
    x1 = x + lengthdir_x(200, direction);
    y1 = y + lengthdir_y(200, direction);
    x2 = x1 + lengthdir_x(line_length, direction + 180);
    y2 = y1 + lengthdir_y(line_length, direction + 180);
    draw_line_width_color(x1, y1, x2, y2, width, c_red, c_red);
}
with (obj_bullet_knight_stream)
{
    if (width > 8)
        draw_line_width_color(x1, y1, x2, y2, width * (0.8 + (sin(global.time * pi) * 0.2)), c_maroon, c_maroon);
}
with (obj_bullet_knight_stream)
{
    if (width > 8)
        draw_line_width_color(x1, y1, x2, y2, width * (0.65 + (sin(global.time * pi) * 0.2)), c_black, c_black);
}
scr_draw_in_box_end();
