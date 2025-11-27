if (!enabled)
    exit;
var _angle = angle_position + obj_rotating_tower_controller_new.tower_angle;
while (_angle > 360)
    _angle -= 360;
while (_angle < 0)
    _angle += 360;
if (mode == 0)
{
    x += (bullet_speed * obj_rotating_tower_controller_new.col_blend);
    if (bullet && global.interact == 0 && i_ex(obj_climb_kris) && obj_climb_kris.fallingcon == 0 && obj_climb_kris.graboncon == 0 && _angle > 86 && _angle < 94 && abs(y - obj_climb_kris.y) < 20)
        event_user(5);
}
else if (mode == 1)
{
    y += bullet_speed;
    ystart += bullet_speed;
    if (y > (cameray() + cameraheight()))
        instance_destroy();
}
else if (mode == 2)
{
    angle_position -= 2;
    y += bullet_speed;
    ystart += bullet_speed;
    if (y > (cameray() + cameraheight()))
        instance_destroy();
}
else if (mode == 4)
{
    x = startx + (sin(current_time * 0.0005 * bullet_speed) * 64);
    if (bullet && global.interact == 0 && i_ex(obj_climb_kris) && _angle > 88 && _angle < 92 && abs(y - obj_climb_kris.y) < 20)
        event_user(5);
}
else if (mode == 5)
{
    y = starty + (cos(current_time * 0.0005 * bullet_speed) * 80);
    ystart = y;
    if (bullet && global.interact == 0 && i_ex(obj_climb_kris) && _angle > 88 && _angle < 92 && abs(y - obj_climb_kris.y) < 20)
        event_user(5);
}
else if (mode == 6)
{
    x = startx + (sin((current_time * 0.0005 * bullet_speed) + 3.14) * -80);
    y = starty + (cos(current_time * 0.0005 * bullet_speed) * 80);
    ystart = y;
    if (bullet && global.interact == 0 && i_ex(obj_climb_kris) && _angle > 88 && _angle < 92 && abs(y - obj_climb_kris.y) < 20)
        event_user(5);
}
if (x > obj_rotating_tower_controller_new.tower_circumference && dodraw == false)
    x -= obj_rotating_tower_controller_new.tower_circumference;
event_inherited();
if ((_angle > 350 && _angle <= 360) || _angle >= 180)
    image_xscale = start_xscale - 0.2;
else if (_angle >= 30 && _angle < 90)
    image_xscale = lerp(start_xscale, start_xscale + 0.4, (_angle - 30) / 60);
else if (_angle >= 90 && _angle < 150)
    image_xscale = lerp(start_xscale + 0.4, start_xscale, (_angle - 90) / 60);
else if (_angle >= 0 && _angle < 30)
    image_xscale = lerp(start_xscale - 0.2, start_xscale, _angle / 30);
else if (_angle >= 150 && _angle < 180)
    image_xscale = lerp(start_xscale, start_xscale - 0.2, (_angle - 150) / 30);
image_xscale = lerp(start_xscale, image_xscale, obj_rotating_tower_controller_new.col_blend);
image_yscale = image_xscale;
