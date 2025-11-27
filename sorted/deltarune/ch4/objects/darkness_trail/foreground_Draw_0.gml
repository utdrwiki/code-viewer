if (!active)
    exit;
draw_set_color(c_black);
d_circle(x, y, width / 2, false);
var _col_a = start_color;
var _col_b = end_color;
var _lastpos = new Vector2(x, y);
var _pos = new Vector2(x, y);
with (owner)
{
    draw_set_color(c_black);
    d_circle(x, y, width / 2, false);
    var i = array_length(points) - 1;
    while (i >= 0)
    {
        var _size = lerp(end_size, width, points[i].life);
        _pos.x = points[i].x;
        _pos.y = points[i].y;
        if (i < (array_length(points) - 1))
        {
            draw_set_color(c_black);
            d_circle(points[i].x, points[i].y, lerp(end_size, width, points[i].life) / 2, false);
            d_line_width_color(_lastpos.x, _lastpos.y, _pos.x, _pos.y, _size, 0, 0);
        }
        _lastpos.x = _pos.x;
        _lastpos.y = _pos.y;
        i--;
    }
    d_line_width_color(_lastpos.x, _lastpos.y, x, y, width, 0, 0);
}
