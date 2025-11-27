if (!init)
{
    init = 1;
    if (!i_ex(obj_rotating_tower_controller_new))
        instance_destroy();
}
angle_position = (360 * x) / obj_rotating_tower_controller_new.tower_circumference;
var _angle = angle_position + obj_rotating_tower_controller_new.tower_angle;
if (_angle > 360)
    _angle -= 360;
else if (_angle < 0)
    _angle += 360;
var _distance_from_tower = 15;
if (obj_rotating_tower_controller_new.appearance == 2)
    _distance_from_tower = 45;
tower_x = obj_rotating_tower_controller_new.tower_x + lengthdir_x(obj_rotating_tower_controller_new.tower_radius + _distance_from_tower, _angle);
y = ystart;
var factor = sin(degtorad(_angle));
if (_angle > 350 || _angle <= 170)
{
    depth = obj_rotating_tower_controller_new.depth - (factor * 10);
    active = 1;
}
else
{
    depth = obj_rotating_tower_controller_new.depth + 50;
    active = 0;
}
if (dodraw == true)
    depth = obj_rotating_tower_controller_new.depth - 1;
darken_alpha = 1 - factor;
