draw_set_color(c_yellow);
draw_set_alpha(image_alpha / 5);
d_circle(x, y, radius, false);
draw_set_alpha(image_alpha / 12);
d_circle(x, y, radius + ((sin(timer / 8) * radius) / 4), false);
d_circle(x, y, radius + ((sin((timer / 12) + 8) * radius) / 8), false);
draw_set_alpha(1);
draw_set_color(-1);
