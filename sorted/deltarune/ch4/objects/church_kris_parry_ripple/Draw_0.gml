if (!surface_exists(surf))
    surf = surface_create(room_width, room_height);
active = true;
var _ripplecount = ripplecount;
if (type == 1)
{
    _ripplecount = 1;
    subrings = 4;
}
else if (type == 0)
{
    _ripplecount += 2;
}
else if (type == 2)
{
    _ripplecount = 1;
}
if (type == 2)
    subrings = 3;
if (active)
{
    draw_set_color(color);
    var _itv = 0;
    var _max_radius = max_radius;
    if (type == 1)
        _max_radius = 520;
    if (type == 2)
        _max_radius = 100;
    if (type == 2 && version == 1)
        _max_radius = 120;
    var _life = 40;
    if (type == 2)
        _life = 60;
    if (type == 2 && version == 1)
        _life = 15;
    if (type == 2 && version == 2)
        _life = 120;
    if (type == 2 && version == 3)
        _life = 160;
    var _pow = 2;
    var _thickness = (type == 1) ? 1 : 1;
    var _ringcount = 0;
    if (version == 1 || version == 2)
    {
        if (colortimer < 1)
            colortimer += 0.015;
        if (colortimer > 1)
            colortimer = 1;
        color = merge_color(colorstart, c_black, colortimer);
    }
    if (version == 3)
    {
        if (colortimer < 1)
            colortimer += 0.01;
        if (colortimer > 1)
            colortimer = 1;
        color = merge_color(colorstart, c_black, colortimer);
    }
    if (type == 1)
    {
        var _faux_timer = timer;
        var _interval = 2;
        var _subsize = 1;
        if (timer > _life)
            timer = _life + (timer % _interval);
        var _radius = scr_ease_out(_faux_timer / _life, subrings + 1) * _max_radius;
        var _submax = min(1, scr_ease_out(timer / _life, subrings + 1)) * _max_radius;
        var _col_index = 0;
        draw_set_color(color);
        draw_set_alpha(1 - (_col_index / subrings));
        surface_set_target(surf);
        draw_clear_alpha(c_black, 0);
        gpu_set_blendmode_ext(bm_one, bm_zero);
        d_circle(x, y, _radius, false);
        _faux_timer -= _subsize;
        var _first = true;
        while (_faux_timer > 0)
        {
            _radius = scr_ease_out(clamp01(_faux_timer / _life), subrings + 1) * _max_radius;
            if (_radius < (_submax + 100))
            {
            }
            _col_index++;
            if (_col_index > subrings)
                _col_index = 0;
            var _alpha = 1 - (_col_index / subrings);
            draw_set_alpha(_alpha * clamp01(1 - (((_radius / _max_radius) * 8) - 7)));
            d_circle(x, y, _radius, false);
            if (_col_index == subrings)
            {
                _faux_timer -= _interval;
                if (_faux_timer <= 0 && looping && deltatime > 1)
                {
                    looping = false;
                    end_timer = _faux_timer;
                    debug_print("end timer declared");
                }
                if (!looping && _faux_timer <= end_timer)
                    break;
            }
            else
            {
                _faux_timer -= _subsize;
            }
        }
        draw_set_alpha(1);
        surface_reset_target();
        gpu_set_blendmode(bm_normal);
        draw_surface(surf, 0, 0);
    }
    else
    {
        for (var i = 0; i < _ripplecount; i++)
        {
            var _timer = (type == 1) ? fixed_timer : timer;
            surface_set_target(surf);
            if (type == 1 && _timer < (_life * 0.75))
                draw_clear_alpha(c_black, 1);
            else
                draw_clear_alpha(c_black, 0);
            _ringcount++;
            var _radius = scr_ease_out(clamp01(inverselerp(0, _life + (i * 30), _timer)), 4) * _max_radius;
            var _col = color;
            var _alpha = 1 - (((_radius / _max_radius) * 8) - 7);
            draw_set_color(_col);
            draw_set_alpha(_alpha);
            var _oradius = _radius;
            gpu_set_blendmode_ext(bm_one, bm_zero);
            d_circle(x, y, _radius, false);
            var _subradius = _radius;
            if ((_timer - 2) < 0)
            {
                draw_set_alpha(1);
                gpu_set_blendmode(bm_normal);
                surface_reset_target();
                draw_surface(surf, 0, 0);
                break;
            }
            var _prog = 1;
            for (var ii = 1; ii < subrings; ii++)
            {
                _alpha = 1 - (ii / subrings);
                _prog = 1 - scr_ease_in(clamp01(_radius / _max_radius), 2);
                _alpha = clamp01(_alpha - clamp01(((_radius / _max_radius) * 8) - 7));
                draw_set_alpha(_alpha);
                if (type == 1)
                    _subradius -= (80 + (80 * _prog));
                if (type == 2)
                    _subradius -= (3 + (3 * _prog));
                else
                    _subradius -= (4 + (4 * _prog));
                if (_subradius > 0)
                    d_circle(x, y, _subradius, false);
            }
            draw_set_color(c_black);
            if (type == 0)
                _subradius -= (4 + (4 * _prog));
            else if (type == 2)
                _subradius -= (3 + (3 * _prog));
            else
                _subradius -= (80 + (80 * _prog));
            draw_set_alpha(0);
            d_circle(x, y, _subradius, false);
            draw_set_alpha(1);
            surface_reset_target();
            gpu_set_blendmode(bm_normal);
            draw_surface(surf, 0, 0);
        }
    }
    timer += deltatime;
    fixed_timer++;
    if (type == 1 && !looping)
    {
        end_timer += deltatime;
        scr_debug_print_persistent("endtimer", string(end_timer));
        if (end_timer >= _life)
        {
            active = false;
            instance_destroy();
            scr_debug_delete_persistent("endtimer");
        }
    }
    if (type != 1 && (timer - _thickness) >= ((_itv * _ripplecount) + (_life * _ripplecount)))
    {
        timer = 0;
        active = false;
        instance_destroy();
    }
}
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
draw_set_color(c_white);
