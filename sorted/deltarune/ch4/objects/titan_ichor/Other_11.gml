var _sin = sin(siner / sin_speed) * sin_size;
if ((radius + _sin) < 0)
    exit;
draw_set_color(c_black);
d_circle(x, y, radius + _sin, false);
