timer++;
y -= (sin(timer) * 0.3);
x -= cos(timer / 24);
draw_set_alpha(ball_alpha);
draw_set_color(c_white);
d_ellipse(x - radius - 2, y - radius - 2, x + radius + 2, y + radius + 2, false);
draw_set_color(c_black);
d_ellipse(x - radius, y - radius, x + radius, y + radius, false);
draw_set_alpha(1);
