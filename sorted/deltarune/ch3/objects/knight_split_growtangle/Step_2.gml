var _dist = round(distance);
if (con == 0)
    _dist = 0;
var _sw = vertical ? _dist : 0;
var _sh = vertical ? 0 : _dist;
if (diagonal)
{
    _sw = sqrt(0.5) * _dist;
    _sh = sqrt(0.5) * _dist;
}
var _tl = new Vector2(obj_growtangle.xstart - 70 - _sw, obj_growtangle.ystart - 70 - _sh);
var _br = new Vector2(obj_growtangle.xstart + 52 + _sw, obj_growtangle.ystart + 52 + _sh);
var _dist_change = sqrt(0.5) * (_dist - round(old_distance));
var _heart_start;
if (diagonal && _dist_change != 0)
    _heart_start = new Vector2(obj_heart.x, obj_heart.y);
if (obj_heart.x < _tl.x)
    obj_heart.x = _tl.x;
if (obj_heart.x > _br.x)
    obj_heart.x = _br.x;
if (obj_heart.y < _tl.y)
    obj_heart.y = _tl.y;
if (obj_heart.y > _br.y)
    obj_heart.y = _br.y;
if (diagonal && _dist_change != 0)
{
    var _heart_change = _heart_start;
    _heart_change.x = clamp(obj_heart.x - _heart_start.x, -abs(_dist_change), abs(_dist_change));
    _heart_change.y = clamp(obj_heart.y - _heart_start.y, -abs(_dist_change), abs(_dist_change));
    if (_heart_change.x != 0)
    {
        if (!vertical)
            obj_heart.y += _heart_change.x;
        else
            obj_heart.y -= _heart_change.x;
    }
    if (_heart_change.y != 0)
    {
        if (!vertical)
            obj_heart.x += _heart_change.y;
        else
            obj_heart.x -= _heart_change.y;
    }
}
obj_heart.x = round(obj_heart.x);
obj_heart.y = round(obj_heart.y);
