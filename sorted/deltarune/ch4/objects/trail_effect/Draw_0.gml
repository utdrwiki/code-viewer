draw_set_color(start_color);
d_circle(x, y, width / 2, false);
var _col_a = start_color;
var _col_b = end_color;
var _lastpos = new Vector2(x, y);
var _pos = new Vector2(x, y);
surface_set_target(trail_surf);
draw_clear_alpha(c_black, 0);
var i = array_length(points) - 1;
while (i >= 0)
{
    points[i].color = merge_color(end_color, start_color, points[i].life);
    draw_set_color(points[i].color);
    i--;
}
draw_set_color(start_color);
d_circle(x, y, width / 2, false);
_col_b = end_color;
i = array_length(points) - 1;
while (i >= 0)
{
    _col_b = points[i].color;
    var _size = lerp(end_size, width, points[i].life);
    _pos.x = points[i].x;
    _pos.y = points[i].y;
    if (i < (array_length(points) - 1))
    {
        draw_set_color(_col_b);
        d_circle(points[i].x, points[i].y, lerp(end_size, width, points[i].life) / 2, false);
        d_line_width_color(_lastpos.x, _lastpos.y, _pos.x, _pos.y, _size, _col_a, _col_b);
    }
    _col_a = _col_b;
    _lastpos.x = _pos.x;
    _lastpos.y = _pos.y;
    i--;
}
d_line_width_color(_lastpos.x, _lastpos.y, x, y, width, start_color, _col_b);
surface_reset_target();
gpu_set_blendmode(bm_add);
draw_surface(trail_surf, 0, 0);
gpu_set_blendmode(bm_normal);
