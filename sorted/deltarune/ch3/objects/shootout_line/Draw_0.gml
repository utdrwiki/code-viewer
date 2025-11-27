var _dist = point_distance(x, y, tx, ty);
var _heart_gap = 24;
var _heart_num = _dist div _heart_gap;
_heart_gap += frac(_dist / _heart_gap);
var _progress = timer / duration;
var _thickness = lerp(6, 2, _progress);
var _sx = lerp(x, tx, _progress * 0.5);
var _sy = lerp(y, ty, _progress * 0.5);
draw_line_width_color(_sx, _sy, tx, ty, _thickness, c_red, c_red);
for (var _h = 0; _h <= _heart_num; _h++)
{
    var _hpos = _h / _heart_num;
    var _hx = lerp(x, tx, _hpos);
    var _hy = lerp(y, ty, _hpos);
    var _ha = 1 - max(0, (_progress + 0.8) - _hpos);
    draw_sprite_ext(spr_shootout_heart_outline, 0, _hx, _hy, 2, 2, 0, c_white, _ha);
}
