if (y < 0 && timer > 12)
    instance_destroy();
if (y > (cameray() + cameraheight()))
    instance_destroy();
timer++;
if (timer == 3)
{
    image_alpha = 1;
    backball = instance_create_depth(x, y, depth + 1, obj_fountainball_back);
    backball.image_xscale = 0.26;
    backball.image_yscale = 0.26;
    backball.image_blend = c_white;
    backball.parentid = id;
}
if (timer < 12)
{
    image_xscale += 0.01;
    image_yscale += 0.01;
}
angle_position += _hspeed;
_y += _vspeed;
_vspeed -= _gravity;
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
x = xstart + lengthdir_x(110, _angle);
y = ((ystart + _y) - (lengthdir_y(30, _angle) * a)) + obj_rotating_tower_controller.yoffset;
if (_angle >= 0 && _angle < 180)
    depth = obj_rotating_tower_controller.depth + 50;
else
    depth = obj_mainchara.depth - 10;
