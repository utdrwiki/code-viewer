if (front == true)
    depth = obj_mainchara.depth - 20;
else
    depth = obj_rotating_tower_controller.depth + 2;
if (!surface_exists(surface))
    surface = surface_create(640 * surface_scale, 640 * surface_scale);
var _dark_col = 3150105;
var _dark2_col = 2230537;
var _light_col = 8138558;
var _dist_min = 175;
var _dist_max = 300;
var _dist = front ? _dist_min : _dist_max;
var _sign = front ? 1 : -1;
var _cnum = array_length(obj_cloud_controller.clouds);
while (_dist >= _dist_min && _dist <= _dist_max)
{
    var _dist_scale = (_dist - _dist_min) / (_dist_max - _dist_min);
    surface_set_target(surface);
    draw_clear_alpha(c_black, 0);
    var _col;
    if (hands)
    {
        for (var _c = 0; _c < _cnum; _c++)
        {
            var _cloud = obj_cloud_controller.clouds[_c];
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
            switch (style)
            {
                case 0:
                    _col = 4210752;
                    break;
                case 1:
                    _col_factor = ((_cloud.z_depth / _dist_max) * -0.5) + 0.5;
                    _col = _dark2_col;
                    break;
            }
            if ((_cloud.__id % 6) == 0)
            {
                var _hy = _y_offset + (sin((current_time / 600) + (_cloud.base_angle * 0.05)) * 80 * surface_scale);
                draw_sprite_ext(spr_rising_darkness_hand, 0, (_cloud.x * surface_scale) + _x_offset, (_cloud.y * surface_scale) + _hy, 2 * surface_scale * (((_cloud.__id % 4) == 0) ? -1 : 1), 2 * surface_scale, 0, _col, 1);
            }
        }
    }
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
    if (!front)
        draw_sprite_ext(spr_rising_bg, 0, 0, (surface_y_offset + (30 * (1 - obj_cloud_controller.y_scale)) + (_dist * 0.2 * _sign)) * surface_scale, 2 * surface_scale, 2 * (surface_scale + ((1 - _dist_scale) * 0.2)), 0, _col, 1);
    else if (_dist == _dist_max)
        draw_sprite_ext(spr_rising_bg, (obj_cloud_controller.y_scale > 0) ? 1 : 0, 0, ((surface_y_offset - (110 * (1 - obj_cloud_controller.y_scale))) + (_dist * 0.3 * _sign)) * surface_scale, 2 * surface_scale, 2 * surface_scale, 0, _col, 1);
    for (var _c = 0; _c < _cnum; _c++)
    {
        var _cloud = obj_cloud_controller.clouds[_c];
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
        var _img_scale = 0.7 + ((((_cloud.z_depth / 300) * -0.5) + 0.5) * 0.4);
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
        draw_sprite_ext(spr_rising_cloudx2, _cloud.__id % 3, (_cloud.x * surface_scale) + _x_offset, (_cloud.y * surface_scale) + _y_offset, 2 * _img_scale * surface_scale, 2 * _img_scale * surface_scale, 0, _col, 1);
    }
    surface_reset_target();
    var _draw_scale = 1 / surface_scale;
    var _col_factor = 0.5 + (_dist_scale * 0.5 * _sign);
    if (outline)
    {
        switch (style)
        {
            case 0:
                _col = merge_color(_dark2_col, _dark_col, _col_factor);
                break;
            case 1:
                _col = merge_color(c_gray, c_gray, _col_factor);
                break;
        }
        draw_surface_ext(surface, 0, obj_cloud_controller.y - surface_y_offset - (_draw_scale * outline), _draw_scale, _draw_scale, 0, _col, 1);
        draw_surface_ext(surface, -_draw_scale * outline, obj_cloud_controller.y - surface_y_offset, _draw_scale, _draw_scale, 0, _col, 1);
        draw_surface_ext(surface, _draw_scale * outline, obj_cloud_controller.y - surface_y_offset, _draw_scale, _draw_scale, 0, _col, 1);
    }
    switch (style)
    {
        case 0:
            _col = merge_color(_dark_col, _light_col, _col_factor);
            break;
        case 1:
            _col = 16777215;
            break;
    }
    draw_surface_ext(surface, 0, obj_cloud_controller.y - surface_y_offset, _draw_scale, _draw_scale, 0, _col, 1);
    _dist += (front ? 125 : -125);
}
if (scr_debug())
{
}
