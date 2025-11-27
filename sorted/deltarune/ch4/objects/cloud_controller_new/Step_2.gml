if (!active)
{
    with (obj_cloud_render_new)
        verticalspeed = 0;
    exit;
}
var _hero_obj = 1049;
if (i_ex(obj_climb_kris))
    _hero_obj = 27;
else
    global.inv--;
var hurt_distance = -15;
other.spd -= 0.2;
if (i_ex(obj_cloud_render_new))
{
    with (obj_cloud_render_new)
    {
        verticalspeed = lerp(max(other.minspeed * other.speedmult, other.spd), other.maxspeed * other.speedmult, clamp(abs(other.y - _hero_obj.y) / 300, 0, 1));
        if ((abs(other.y - _hero_obj.y) / 300) > 1.5 && other.maxspeed != 0)
            verticalspeed = min(verticalspeed, -10 * other.speedmult);
        if (other.y <= other.miny)
            verticalspeed = 0;
        if (front)
        {
            other.y += verticalspeed;
            if (_hero_obj.y > (other.y + hurt_distance))
            {
                if (other.harmless == 1)
                {
                    snd_play(snd_hurt1);
                    other.harmless = 2;
                    if (i_ex(obj_dw_churchc_slidingpiano))
                        obj_dw_churchc_slidingpiano.con = 1;
                }
                else if (other.harmless == 0)
                {
                    if (global.inv < 0 && global.hp[global.char[0]] > 0)
                    {
                        if (global.flag[1583] < 3 && global.hp[global.char[0]] <= other.damage)
                            global.flag[1583]++;
                        other.spd = 10;
                        if (_hero_obj == 27)
                        {
                            with (obj_climb_kris)
                                damagecon = 1;
                        }
                        with (other)
                            event_user(5);
                    }
                }
            }
        }
    }
}
var _center_y = cameray() + 200;
var _center_dist = clamp((y - _center_y) / 340, -1, 1);
y_scale = sin((abs(_center_dist) * pi) / 2) * sign(_center_dist) * 0.2;
cloud_angle += (0.2 * rotatespeed);
var _cnum = array_length(clouds);
for (var _c = 0; _c < _cnum; _c++)
{
    var _cloud = clouds[_c];
    _cloud.angle = _cloud.base_angle + cloud_angle;
    if (i_ex(obj_rotating_tower_controller_new))
        _cloud.angle -= (obj_rotating_tower_controller_new.tower_angle * 0.5) + (0.5 * obj_rotating_tower_controller_new.tower_angle_add);
    _cloud.z_depth = (((abs(angle_difference(_cloud.angle, -90)) / 180) * 2) - 1) * _cloud.dist;
    _cloud.x = lengthdir_x(1, _cloud.angle) * _cloud.dist;
    _cloud.x += 320;
    _cloud.y = lengthdir_y(1, _cloud.angle) * y_scale * (obj_cloud_render_new.surface_y_offset - 200) * 0.015 * _cloud.dist * (obj_cloud_render_new.distance_from_kris / 275);
    if (sloped)
        _cloud.y -= min(0.2 * _cloud.x, 60);
}
array_sort(clouds, sort_cloud);
