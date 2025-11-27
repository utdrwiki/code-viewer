var record_position = 36;
if (hero == "ralsei")
    record_position = 72;
var yy = obj_rotating_tower_controller.yoffset_record[record_position] - obj_rotating_tower_controller.yoffset;
var _angledifference = angle_difference(obj_rotating_tower_controller.tower_angle, obj_rotating_tower_controller.tower_angle_record[record_position]);
var _index = 4;
var xx = 0;
if (_angledifference >= 0 && _angledifference < 90)
    xx = lerp(0, 70, _angledifference / 90);
if (_angledifference >= 90 && _angledifference < 180)
    xx = lerp(70, 0, (_angledifference - 90) / 90);
if (_angledifference >= -90 && _angledifference < 0)
    xx = lerp(0, -70, abs(_angledifference) / 90);
if (_angledifference >= -180 && _angledifference < -90)
    xx = lerp(-70, 0, (abs(_angledifference) - 90) / 90);
if (xx >= 56 && xx < 71)
    _index = 4;
else if (xx >= 40 && xx < 56)
    _index = 3;
else if (xx >= 26 && xx < 40)
    _index = 3;
else if (xx >= 16 && xx < 26)
    _index = 2;
else if (xx >= -16 && xx < 16)
    _index = 2;
else if (xx >= -26 && xx < -16)
    _index = 2;
else if (xx >= -40 && xx < 26)
    _index = 1;
else if (xx >= -56 && xx < -40)
    _index = 1;
else if (xx >= -71 && xx < -56)
    _index = 0;
else
    _index = 6;
if (_angledifference >= 90 && _angledifference < 120)
    darkenalpha = lerp(0, 1, (_angledifference - 90) / 30);
if (_angledifference > -120 && _angledifference <= -90)
    darkenalpha = lerp(0, 1, (abs(_angledifference) - 90) / 30);
if (_angledifference >= 120 || _angledifference < -120)
    darkenalpha = 1;
if (_angledifference < 90 && _angledifference > -90)
    darkenalpha = 0;
var draw_x = obj_mainchara.x + 17 + xx;
draw_y = obj_mainchara.y - yy;
var runmove = 0;
if (abs(obj_rotating_tower_controller.tower_angle_record[record_position] - _xprevious) > 4)
    runmove = 1;
if (abs(obj_rotating_tower_controller.yoffset_record[record_position] - _yprevious) > 4)
    runmove = 1;
if (abs(obj_rotating_tower_controller.tower_angle_record[record_position] - _xprevious) > 0)
    show_debug_message(abs(obj_rotating_tower_controller.tower_angle_record[record_position] - _xprevious));
if (obj_rotating_tower_controller.tower_angle_record[record_position] != _xprevious || obj_rotating_tower_controller.yoffset_record[record_position] != _yprevious)
{
    index += 0.16;
    if (runmove == 1)
        index += 0.2;
    if (index >= 6)
        index = 0;
}
_xprevious = obj_rotating_tower_controller.tower_angle_record[record_position];
_yprevious = obj_rotating_tower_controller.yoffset_record[record_position];
var _sprite;
if (hero == "susie")
{
    _sprite = spr_susie_climb_1;
    if (index < 1)
        _sprite = spr_susie_climb_1;
    else if (index < 2)
        _sprite = spr_susie_climb_2;
    else if (index < 3)
        _sprite = spr_susie_climb_3;
    else if (index < 4)
        _sprite = spr_susie_climb_4;
    else if (index < 5)
        _sprite = spr_susie_climb_5;
    else if (index < 6)
        _sprite = spr_susie_climb_6;
}
else
{
    _sprite = spr_ralsei_climb_1;
    if (index < 1)
        _sprite = spr_ralsei_climb_1;
    else if (index < 2)
        _sprite = spr_ralsei_climb_2;
    else if (index < 3)
        _sprite = spr_ralsei_climb_3;
    else if (index < 4)
        _sprite = spr_ralsei_climb_4;
    else if (index < 5)
        _sprite = spr_ralsei_climb_5;
    else if (index < 6)
        _sprite = spr_ralsei_climb_6;
}
draw_sprite_ext(_sprite, _index, draw_x, draw_y - 8, 2, 2, 0, c_white, 1);
d3d_set_fog(true, c_black, 0, 1);
draw_sprite_ext(_sprite, _index, draw_x, draw_y - 8, 2, 2, 0, c_white, 0.5);
d3d_set_fog(false, c_black, 0, 0);
draw_set_color(c_white);
draw_text(10, 20, yy);
draw_text(10, 20, _angledifference);
if (_angledifference >= 90 || _angledifference < -90)
{
    depth = obj_rotating_tower_controller.depth + 40;
}
else
{
    var offset = 0;
    if (hero == "susie")
    {
        for (var i = 0; i < instance_number(obj_rotating_tower_caterpillar); i += 1)
        {
            _hero[i] = instance_find(obj_rotating_tower_caterpillar, i);
            if (_hero[i].hero == "ralsei")
            {
                if (_hero[i].draw_y > draw_y)
                    offset = 1;
            }
        }
    }
    if (hero == "ralsei")
    {
        for (var i = 0; i < instance_number(obj_rotating_tower_caterpillar); i += 1)
        {
            _hero[i] = instance_find(obj_rotating_tower_caterpillar, i);
            if (_hero[i].hero == "susie")
            {
                if (_hero[i].draw_y > draw_y)
                    offset = 1;
            }
        }
    }
    if (_index == 2)
        depth = (obj_mainchara.depth - 2) + offset;
    else
        depth = obj_mainchara.depth + 1 + offset;
}
