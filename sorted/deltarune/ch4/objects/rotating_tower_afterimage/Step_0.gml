if (!i_ex(obj_rotating_tower_controller_new))
{
    instance_destroy();
    exit;
}
event_inherited();
image_alpha -= 0.15;
darken_alpha += 0.15;
if (image_alpha <= 0)
    instance_destroy();
var _angle = angle_position + obj_rotating_tower_controller_new.tower_angle;
if (_angle > 360)
    _angle -= 360;
if (_angle < 0)
    _angle += 360;
if (_angle >= 30 && _angle < 150)
    image_xscale = 0.8;
if (_angle >= 210 && _angle < 270)
    image_xscale = lerp(1, 1.3, (_angle - 210) / 60);
else if (_angle >= 270 && _angle < 330)
    image_xscale = lerp(1.3, 1, (_angle - 270) / 60);
else if (_angle >= 180 && _angle < 360)
    image_xscale = 1;
if (_angle >= 0 && _angle < 30)
    image_xscale = lerp(0.8, 1, _angle / 30);
if (_angle >= 150 && _angle < 180)
    image_xscale = lerp(1, 0.8, (_angle - 150) / 30);
image_yscale = image_xscale;
if (_angle > 40 && _angle < 140)
    depth += 100;
if (parenttarget_x != -1)
{
    x = parenttarget_x;
    y = parenttarget_y;
    image_xscale = parenttarget_xscale;
    image_yscale = parenttarget_yscale;
}
