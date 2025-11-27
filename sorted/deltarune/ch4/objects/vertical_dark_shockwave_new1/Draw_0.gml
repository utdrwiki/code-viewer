var _angle = angle_position + obj_rotating_tower_controller.tower_angle;
if (_angle > 360)
    _angle -= 360;
if (_angle < 0)
    _angle += 360;
var extra_scale = 0;
if (_angle >= 30 && _angle < 150)
    extra_scale = -0.4;
if (_angle >= 210 && _angle < 270)
    extra_scale = lerp(0, 0.6, (_angle - 210) / 60);
else if (_angle >= 270 && _angle < 330)
    extra_scale = lerp(0.6, 0, (_angle - 270) / 60);
else if (_angle >= 180 && _angle < 360)
    extra_scale = 1;
if (_angle >= 0 && _angle < 30)
    extra_scale = lerp(-0.4, 0, _angle / 30);
if (_angle >= 150 && _angle < 180)
    extra_scale = lerp(0, -0.4, (_angle - 150) / 30);
draw_sprite_ext(sprite_index, image_index, x + _xoffset, y + _yoffset, image_xscale + extra_scale, image_yscale + extra_scale, image_angle, image_blend, image_alpha);
d3d_set_fog(true, c_black, 0, 1);
draw_sprite_ext(sprite_index, image_index, x + _xoffset, y + _yoffset, image_xscale + extra_scale, image_yscale + extra_scale, image_angle, image_blend, darken_alpha);
d3d_set_fog(false, c_black, 0, 0);
