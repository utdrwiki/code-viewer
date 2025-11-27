if (angle_position > 360)
    angle_position -= 360;
if (angle_position < 0)
    angle_position += 360;
var _angle = angle_position + obj_rotating_tower_controller.tower_angle;
if (_angle > 360)
    _angle -= 360;
if (_angle < 0)
    _angle += 360;
var a = 1;
if (y > (cameray() - 40) && y < (cameray() + 550))
    a = lerp(1, -0.3, y / 480);
x = xstart + lengthdir_x(80, _angle);
y = (ystart - (lengthdir_y(30, _angle) * a)) + obj_rotating_tower_controller.yoffset;
if (_angle > 180 && _angle < 360)
    active = 1;
else
    active = 0;
if (_angle >= 0 && _angle < 180)
    depth = obj_rotating_tower_controller.depth + 50;
else
    depth = obj_mainchara.depth - 10;
if (_angle >= 30 && _angle < 150)
    darken_alpha = 1;
if (_angle >= 180 && _angle < 360)
    darken_alpha = 0;
if (_angle >= 0 && _angle < 30)
    darken_alpha = lerp(0, 1, _angle / 30);
if (_angle >= 150 && _angle < 180)
    darken_alpha = lerp(1, 0, (_angle - 150) / 30);
