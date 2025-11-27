active = true;
var _ripplecount = ripplecount;
if (type == 1)
    _ripplecount = 1;
else if (type == 0)
    _ripplecount += 2;
else if (type == 2)
    _ripplecount = 1;
if (type == 2)
    subrings = 3;
if (active)
{
    draw_set_color(color);
    var _itv = 0;
    var _max_radius = 400;
    if (type == 1)
        _max_radius = 520;
    if (type == 2)
        _max_radius = 100;
    var _life = 40;
    if (type == 2)
        _life = 60;
    var _pow = 2;
    var _thickness = (type == 1) ? 1 : 1;
    var _ringcount = 0;
    if (type == 1)
    {
        var _faux_timer = timer;
        var _interval = 2;
        var _subsize = 1;
        if (timer > _life)
            timer = _life + (timer % _interval);
        var _radius = scr_ease_out(_faux_timer / _life, 4) * _max_radius;
        var _submax = min(1, scr_ease_out(timer / _life, 4)) * _max_radius;
        var _col_index = 0;
        draw_set_color(merge_color(color, c_black, _col_index / 3));
        d_circle(x, y, _radius, false);
        _faux_timer -= _subsize;
        while (_faux_timer > 0)
        {
            _radius = scr_ease_out(clamp01(_faux_timer / _life), 4) * _max_radius;
            if (_radius < (_submax + 100))
            {
            }
            _col_index++;
            if (_col_index > 3)
                _col_index = 0;
            var _col = merge_color(color, c_black, _col_index / 3);
            draw_set_color(merge_color(_col, c_black, clamp01(((_radius / _max_radius) * 8) - 7)));
            d_circle(x, y, _radius, false);
            if (_col_index == 3)
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
    }
    else
    {
        for (var i = 0; i < _ripplecount; i++)
        {
            _ringcount++;
            var _radius = scr_ease_out(clamp01(inverselerp(i * _itv, (i * _itv) + _life + (i * 30), timer)), 4) * _max_radius;
            var _col = merge_color(color, c_black, clamp01(((_radius / _max_radius) * 8) - 7));
            draw_set_color(_col);
            var _oradius = _radius;
            d_circle(x, y, _radius, false);
            var _subradius = _radius;
            if ((timer - 2) < 0)
                break;
            var _prog = 1;
            for (var ii = 1; ii < subrings; ii++)
            {
                _col = merge_color(color, c_black, ii / subrings);
                _prog = scr_ease_in(clamp01(_radius / _max_radius), 2);
                draw_set_color(merge_color(_col, c_black, clamp01(((_radius / _max_radius) * 8) - 7)));
                if (type == 1)
                    _subradius -= (20 + (20 * _prog));
                if (type == 2)
                    _subradius -= 6;
                else
                    _subradius -= 10;
                if (_subradius > 0)
                    d_circle(x, y, _subradius, false);
            }
            draw_set_color(c_black);
            if (type == 0)
                _subradius = _subradius - 10;
            else if (type == 2)
                _subradius = _subradius - 4;
            else
                _subradius -= 16;
            d_circle(x, y, _subradius, false);
        }
    }
    timer += deltatime;
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
