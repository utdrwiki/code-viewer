var _sin = sin(siner / sin_speed) * sin_size;
if ((radius + _sin + rim) < 0)
    exit;
draw_set_color(c_white);
d_circle(x, y, radius + _sin + rim, false);
