if (!active)
    exit;
draw_set_color(c_black);
d_circle(x, y, width / 2, false);
var _col_a = start_color;
var _col_b = end_color;
var _lastpos = new Vector2(x, y);
var _pos = new Vector2(x, y);
