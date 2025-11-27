var _slash = instance_create(obj_growtangle.x + (flip ? 20 : -20), obj_growtangle.y, obj_roaringknight_quickslash);
var _xx = knight.x + 100;
var _minAngle = min_angle;
var _maxAngle = max_angle;
if (flip)
{
    _minAngle -= 180;
    _maxAngle -= 180;
    _xx = obj_growtangle.x - abs(_xx - obj_growtangle.x);
}
with (_slash)
{
    var _targetdir = point_direction(_xx, obj_growtangle.y, obj_heart.x + 8, obj_heart.y + 8);
    other.count++;
    flip = other.flip;
    if (flip)
        _targetdir = angle_difference(_targetdir, 0);
    if (other.count == 5)
        other.count = 0;
    else
        _targetdir += random_range(-other.spawn_range, other.spawn_range);
    _targetdir = scr_pingpong_ext(_targetdir, _minAngle, _maxAngle);
    if (flip)
    {
        image_xscale *= -1;
        scr_orbitaroundpoint(_xx, obj_growtangle.y, _targetdir);
    }
    else
    {
        _targetdir -= 180;
        scr_orbitaroundpoint(_xx, obj_growtangle.y, _targetdir);
    }
    image_angle = _targetdir;
    direction = _targetdir;
}
if (flip_mode)
    flip = !flip;
