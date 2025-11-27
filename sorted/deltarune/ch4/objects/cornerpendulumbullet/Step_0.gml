image_alpha += 0.1;
if (image_alpha == 1.5)
    active = 1;
var _shaftdir = point_direction(x, y, swingpoint_x, swingpoint_y);
var _accel, _swingdir;
switch (vertical_mirroring)
{
    case 1:
        if (_shaftdir < 90 || _shaftdir > 270)
            _swingdir = _shaftdir - 90;
        else
            _swingdir = _shaftdir + 90;
        _accel = lengthdir_y(0.5, _swingdir);
        break;
    case -1:
        if (_shaftdir < 90 || _shaftdir > 270)
            _swingdir = _shaftdir + 90;
        else
            _swingdir = _shaftdir - 90;
        _accel = -lengthdir_y(0.5, _swingdir);
        break;
}
hspeed += lengthdir_x(_accel, _swingdir);
vspeed += lengthdir_y(_accel, _swingdir);
if (_swingdir < (direction - 180))
    _swingdir += 360;
if (_swingdir > (direction + 180))
    _swingdir -= 360;
if (direction > (_swingdir - 90) && direction < (_swingdir + 90))
    direction = _swingdir;
else
    direction = _swingdir - 180;
x = swingpoint_x - lengthdir_x(swingdistance, _shaftdir);
y = swingpoint_y - lengthdir_y(swingdistance, _shaftdir);
image_angle = point_direction(swingpoint_x, swingpoint_y, x, y) + 90;
if ((x >= swingtarget_x && (direction > 330 || direction < 30)) || (x <= swingtarget_x && direction > 150 && direction < 210))
{
    x = swingtarget_x;
    y = swingtarget_y;
    with (obj_growtangle)
    {
        var _box = instance_create_depth(x, y, depth, obj_growtanglebellshake);
        _box.image_xscale = image_xscale;
        _box.image_yscale = image_yscale;
        _box.image_alpha = image_alpha;
        _box.splash_x = other.x;
        _box.splash_y = other.y;
        visible = false;
    }
    instance_destroy();
}
