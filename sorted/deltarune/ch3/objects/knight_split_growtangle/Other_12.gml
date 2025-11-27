debug_print("old called");
timer++;
if (con == 0)
{
    if (timer == 20)
    {
        snd_play_x(snd_knight_boxbreak, 1, 1.1);
        var _speed = 0;
        var _balance_top = 0;
        var _balance_bottom = 0;
        var _change = 0;
        event_user(0);
        event_user(1);
        if ((obj_heart.y + 10) < obj_growtangle.y)
            heart_y = -1;
        else
            heart_y = 1;
        snd_play(snd_chargeshot_fire);
        var _xstart = obj_growtangle.x - 66;
        var _b = -4;
        for (var _i = 0; _i < 14; _i++)
        {
            var _balance = ((_i % 2) == 0) ? _balance_top : _balance_bottom;
            if (_balance >= 3)
                _change = -1;
            else if (_balance <= -3)
                _change = 1;
            else
                _change = choose(1, -1);
            _speed = _change ? 8 : 4;
            if ((_i % 2) == 0)
                _balance_top += _change;
            else
                _balance_bottom += _change;
            _b = instance_create(_xstart, y, obj_roaringknight_fountain_bullet);
            _b.speed = 0;
            _b.top_speed = _speed + random_range(-0.1, 0.1);
            _b.image_speed = _speed / 8;
            _b.depth = depth + 1;
            _b.image_xscale = 1;
            _b.image_yscale = 1;
            if ((_i % 2) == 1)
            {
                _b.direction = -90;
                _b.image_angle = 180;
            }
            else
            {
                _b.direction = 90;
            }
            scr_bullet_inherit(_b);
            child_bullet[count] = _b;
            count++;
            if (_change)
            {
                _b = instance_create(_xstart, y, obj_roaringknight_fountain_bullet);
                _b.speed = 0;
                _b.top_speed = 2 + random_range(-0.1, 0.1);
                _b.image_speed = 0.25;
                _b.depth = depth + 1;
                _b.image_xscale = 1;
                _b.image_yscale = 1;
                if ((_i % 2) == 0)
                {
                    _b.direction = -90;
                    _b.image_angle = 180;
                }
                else
                {
                    _b.direction = 90;
                }
                scr_bullet_inherit(_b);
                child_bullet[count] = _b;
                count++;
            }
            if ((_i % 2) == 1)
                _xstart += 22;
        }
    }
}
else if (con == 1)
{
    if (timer == 15)
    {
        for (i = 0; i < count; i++)
        {
            if (i_ex(child_bullet[i]))
                child_bullet[i].depth = obj_growtangle.depth - 10;
        }
    }
    if (timer <= 30)
    {
        var _old_distance = distance;
        distance = scr_ease_out(timer / 30, 6) * split_dist;
        obj_heart.y += ((distance - _old_distance) * heart_y * 1.25);
    }
    else
    {
        event_user(0);
    }
}
if (con >= 1)
{
    var _quarterbox = 37.5;
    var _boxy = y + ((distance + _quarterbox) * heart_y);
    if (obj_heart.y < ((_boxy - _quarterbox) + 4))
        obj_heart.y = (_boxy - _quarterbox) + 4;
    if (obj_heart.y > ((_boxy + _quarterbox) - 24))
        obj_heart.y = (_boxy + _quarterbox) - 24;
}
var _dist = round(distance);
marker[0].y = y - _dist - 1;
marker[1].y = y + _dist + 3;
