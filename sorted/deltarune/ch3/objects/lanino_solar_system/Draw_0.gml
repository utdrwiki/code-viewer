draw_line_width_color(x, y, x, 0, 2, c_gray, c_gray);
draw_self();
for (a = 0; a < 6; a++)
    draw_sprite_ext(spr_lanino_sun2_ray, ray[a], x + lengthdir_x(34, (a * 60) - 30), y + lengthdir_y(34, (a * 60) - 30), 1, 2, (a * 60) - 30, c_white, image_alpha);
