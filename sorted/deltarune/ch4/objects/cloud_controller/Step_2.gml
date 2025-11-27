if (abs(y - obj_mainchara.y) > 266)
    y -= 5;
else if (abs(y - obj_mainchara.y) > 120)
    y -= 2;
else
    y -= 1;
if (collision_rectangle(0, y + 20, 640, y + 300, obj_mainchara, 1, 0) && global.inv < 0)
    event_user(5);
var _center_y = cameray() + 200;
var _center_dist = clamp((y - _center_y) / 340, -1, 1);
y_scale = sin((abs(_center_dist) * pi) / 2) * sign(_center_dist) * 0.2;
cloud_angle += 0.2;
var _cnum = array_length(clouds);
for (var _c = 0; _c < _cnum; _c++)
{
    var _cloud = clouds[_c];
    _cloud.angle = _cloud.base_angle + cloud_angle + (obj_rotating_tower_controller.tower_angle * 0.5);
    _cloud.z_depth = (((abs(angle_difference(_cloud.angle, -90)) / 180) * 2) - 1) * _cloud.dist;
    _cloud.x = lengthdir_x(1, _cloud.angle) * _cloud.dist;
    _cloud.x += 320;
    _cloud.y = lengthdir_y(1, _cloud.angle) * y_scale * _cloud.dist;
}
array_sort(clouds, sort_cloud);
