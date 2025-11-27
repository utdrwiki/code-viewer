if (i_ex(obj_rotating_tower_controller_new))
{
    if (front == true)
        depth = obj_rotating_tower_controller_new.depth - 200;
    else
        depth = obj_rotating_tower_controller_new.depth + 50;
}
else if (!i_ex(obj_dw_churchc_titanclimb2_post))
{
    if (front)
        depth = 1000;
    else
        depth = 2000005;
}
if (!surface_exists(surface))
    surface = surface_create(640 * surface_scale, 840 * surface_scale);
var _dark_col = 3150105;
var _dark2_col = 2230537;
var _light_col = 8138558;
var _dist_min = 175;
var _dist_max = 300;
var _dist = front ? _dist_min : _dist_max;
var _sign = front ? 1 : -1;
var _cnum = array_length(obj_cloud_controller_new.clouds);
var _hero_obj = 1049;
if (i_ex(obj_climb_kris))
    _hero_obj = 27;
surface_set_target(surface);
draw_clear_alpha(c_black, 0);
var _draw_scale, _col;
while (_dist >= _dist_min && _dist <= _dist_max)
{
    var _dist_scale = (_dist - _dist_min) / (_dist_max - _dist_min);
    switch (style)
    {
        case 0:
            _col = 16777215;
            break;
        case 1:
            _col_factor = ((front ? (_dist_scale * 0.5) : (-_dist_scale * 0.5)) * 0.5) + 0.5;
            _col = merge_color(_dark_col, _light_col, _col_factor);
            break;
    }
    _col = 0;
    if (!front)
    {
        draw_sprite_ext(spr_rising_bg, 0, 0, ((surface_y_offset + (30 * (1 - obj_cloud_controller_new.y_scale)) + (_dist * 0.2 * _sign)) * surface_scale) - 20, 2 * surface_scale, 2 * (surface_scale + ((1 - _dist_scale) * 0.2)), 0, _col, 1);
    }
    else if (_dist == _dist_max)
    {
        var offset = hasspawns ? 4 : 0;
        if (obj_cloud_controller_new.sloped)
        {
            draw_set_color(c_black);
            ossafe_fill_rectangle(0, 170, 640, 480, 0);
        }
        else
        {
            draw_sprite_ext(spr_rising_bg, (obj_cloud_controller_new.y_scale > 0) ? 1 : 0, 0, (((surface_y_offset - (100 * (1 - obj_cloud_controller_new.y_scale))) + (_dist * 0.3 * _sign)) * surface_scale) + offset, 2 * surface_scale, 2 * surface_scale, 0, _col, 1);
        }
    }
    for (var _c = 0; _c < _cnum; _c++)
    {
        var _cloud = obj_cloud_controller_new.clouds[_c];
        if (_cloud.z_depth < 0)
        {
            if (!other.front)
                continue;
        }
        else if (other.front)
        {
            continue;
        }
        if (_cloud.dist != _dist)
            continue;
        var _x_offset = sin((current_time / 500) + _cloud.base_angle) * 4 * surface_scale;
        var _y_offset = (sin((current_time / 250) + (_cloud.base_angle * 0.05)) * 4 * surface_scale) + (surface_y_offset * surface_scale);
        var _img_scale = 1;
        switch (style)
        {
            case 0:
                _col = 16777215;
                break;
            case 1:
                _col_factor = ((_cloud.z_depth / _dist_max) * -0.5) + 0.5;
                _col = merge_color(_dark_col, _light_col, _col_factor);
                break;
        }
        _col = merge_color(c_black, c_white, 0.55 - (0.45 * sin(degtorad(_cloud.angle))));
        if (hasspawns && (_cloud.__id % 3) == 2)
        {
            draw_sprite_ext(spr_titan_spawn_idle, current_time / 100, (_cloud.x * surface_scale) + _x_offset, ((_cloud.y * surface_scale) + _y_offset) - 1, 2 * _img_scale * surface_scale, 2 * _img_scale * surface_scale, 0, _col, 1);
        }
        else
        {
            if (outline)
                draw_sprite_ext(spr_rising_cloudx2, _cloud.__id % 3, (_cloud.x * surface_scale) + _x_offset, ((_cloud.y * surface_scale) + _y_offset) - 1, 2 * _img_scale * surface_scale, 2 * _img_scale * surface_scale, 0, _col, 1);
            draw_sprite_ext(spr_rising_cloudx2_outline, _cloud.__id % 3, (_cloud.x * surface_scale) + _x_offset, (_cloud.y * surface_scale) + _y_offset, 2 * _img_scale * surface_scale, 2 * _img_scale * surface_scale, 0, _col, 1);
        }
    }
    _draw_scale = 1 / surface_scale;
    var _col_factor = 0.5 + (_dist_scale * 0.5 * _sign);
    if (followcamera)
        xoffset = camerax();
    switch (style)
    {
        case 0:
            _col = merge_color(_dark_col, _light_col, _col_factor);
            break;
        case 1:
            _col = 16777215;
            break;
    }
    _col = 16777215;
    _dist += (front ? 125 : -125);
}
surface_reset_target();
if (front)
    draw_surface_ext(surface, xoffset, (cameray() - 200) + distance_from_kris + 2, _draw_scale, _draw_scale, 0, _col, 1);
else
    draw_surface_ext(surface, xoffset, (cameray() - 200) + distance_from_kris, _draw_scale, _draw_scale, 0, _col, 1);
distance_from_kris += (verticalspeed * caminfluence);
if (i_ex(obj_rotating_tower_controller_new))
    tower_y_prev = obj_rotating_tower_controller_new.tower_y;
if (last_hero_y != 0)
    distance_from_kris -= ((cameray() - last_hero_y) * caminfluence);
last_hero_y = cameray();
if (scr_debug())
{
}
