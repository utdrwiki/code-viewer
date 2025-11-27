if (!init)
{
    if (difficulty == 2)
    {
        split_wait = 4;
        split_hold = 26;
    }
    init = true;
}
timer++;
old_distance = distance;
if (con == 1)
{
    if (timer <= 1)
    {
        effect = instance_create(x, y, obj_knight_split_growtangle_effect);
        effect.angle = angle;
        effect.diagonal = diagonal;
        effect.xoffset = xoffset;
        effect.yoffset = yoffset;
        effect.depth = depth - 100;
        effect.vertical = vertical;
        debug_print("SLASH");
    }
    if (timer >= (split_wait + split_delay))
    {
        if (disable_on_close)
        {
            with (split_bullet)
                active = false;
            child_bullet = [];
            count = 0;
        }
        snd_play_x(snd_knight_boxbreak, 1, 1.1);
        var _speed = 0;
        event_user(0);
        if (diagonal)
        {
            var _heartdir = point_direction(x + xoffset, y + yoffset, obj_heart.x + 10, obj_heart.y + 10);
            var _angle = angle + (vertical ? 45 : -45);
            if (abs(angle_difference(_angle, _heartdir)) < 90)
            {
                heart_x = 1;
                heart_y = vertical ? -1 : 1;
            }
            else
            {
                heart_x = -1;
                heart_y = vertical ? 1 : -1;
            }
            debug_print("angle difference is " + string(abs(angle_difference(_angle, _heartdir))));
        }
        else
        {
            if ((obj_heart.x + 10) < (x + xoffset))
                heart_x = -1;
            else
                heart_x = 1;
            if ((obj_heart.y + 10) < (y + yoffset))
                heart_y = -1;
            else
                heart_y = 1;
        }
        debug_print("initial heartxy is (" + string(heart_x) + "," + string(heart_y) + ")");
        if (split_delay > 0)
            snd_play_pitch(snd_chargeshot_fire, 0.5);
        snd_play(snd_chargeshot_fire);
        split_delay = 0;
        var _range = bullet_range;
        var _total = bullet_count;
        var _odd = false;
        if ((bullet_count % 2) == 1)
        {
            _odd = true;
            _total += 1;
        }
        var _flip = choose(true, false);
        var _shift = _range / ((_total / 2) - 1);
        var _trueangle = vertical ? (angle + 90) : angle;
        var _xrange = lengthdir_x(_range, _trueangle);
        var _yrange = lengthdir_y(_range, _trueangle);
        var _xshift = _xrange / ((_total / 2) - 1);
        var _yshift = _yrange / ((_total / 2) - 1);
        var _xstart = x - (_xrange / 2);
        var _ystart = y - (_yrange / 2);
        var _weight = 0;
        var _direction = 0;
        for (var _i = 0; _i < bullet_count; _i++)
        {
            if (!diagonal && _i == (_total / 2))
            {
                _xstart = x - (_xrange / 2);
                _ystart = y - (_yrange / 2);
                if (_odd)
                {
                    _xstart += (_xshift / 2);
                    _ystart += (_yshift / 2);
                }
                _weight = 0;
                _flip = !_flip;
            }
            if (_weight == 0)
                _weight = choose(-2, -1, 1, 2);
            _speed = inverselerp(-1, 1, sign(-_weight));
            if (diagonal)
                _b = instance_create(x, y, split_bullet);
            else
                _b = instance_create(_xstart, _ystart, split_bullet);
            _b.friction = (_speed == 1) ? -0.2 : -0.05;
            var _topspeed = (_speed == 1) ? 4 : 2;
            _b.top_speed = _topspeed + random_range(-0.2, 0.2);
            _b.image_speed = 0.5;
            _b.depth = depth + 1;
            _b.image_xscale = 2;
            _b.image_yscale = 2;
            _b.active = false;
            _b.speed = 0;
            if (diagonal)
                _direction += (360 / bullet_count);
            else if (vertical)
                _direction = _flip ? 180 : 0;
            else
                _direction = _flip ? 90 : -90;
            _b.direction = _direction;
            _b.image_angle = _direction;
            scr_bullet_inherit(_b);
            _b.grazed = -1;
            child_bullet[count] = _b;
            count++;
            if (abs(_weight) == 1)
                _weight = choose(1, 2) * sign(-_weight);
            else
                _weight = scr_movetowards(_weight, 0, 1);
            _xstart += _xshift;
            _ystart += _yshift;
        }
    }
}
var _hold = diagonal ? (split_hold + 2) : split_hold;
if (con == 2)
{
    split = true;
    if (timer == 7)
    {
        for (i = 0; i < count; i++)
        {
            if (i_ex(child_bullet[i]))
            {
                child_bullet[i].depth = depth - 10;
                child_bullet[i].active = true;
                child_bullet[i].grazed = 0;
            }
        }
    }
    if (timer <= (_hold / 2))
    {
        distance = scr_ease_out(timer / (split_hold / 2), 3) * max_distance;
        if (diagonal)
        {
            obj_heart.x += ((distance - old_distance) * heart_x * 1);
            obj_heart.y += ((distance - old_distance) * heart_y * 1);
        }
        else if (vertical)
        {
            obj_heart.x += ((distance - old_distance) * heart_x * 1.25);
        }
        else
        {
            obj_heart.y += ((distance - old_distance) * heart_y * 1.25);
        }
    }
    else
    {
        event_user(0);
    }
}
if (con == 3)
{
    distance = max_distance - (scr_ease_in(timer / (split_hold / 2), 3) * max_distance);
    if (timer >= (_hold / 2))
    {
        if (vertical || diagonal)
            vshift = irandom_range(-3, 3);
        else
            hshift = irandom_range(-3, 3);
        if (diagonal)
            hshift = vshift;
        event_user(0);
    }
}
if (con == 4)
{
    distance = scr_movetowards(distance, 0, 12);
    if (distance == 0)
    {
        con = 0;
        split = false;
        if (difficulty == 3)
        {
            if (split_wait > 3)
                split_wait--;
            if (split_hold > 26)
                split_hold -= 2;
        }
        else
        {
            if (split_wait > 5)
                split_wait--;
            if (split_hold > 30)
                split_hold -= 2;
        }
        snd_play(snd_locker);
    }
}
var _dist = round(distance);
if (vertical)
{
    marker[0].image_angle = -90;
    marker[1].image_angle = 90;
    marker[0].x = x - _dist - 1;
    marker[1].x = x + _dist + 3;
    marker[0].y = y - 1;
    marker[1].y = y + 3;
}
else
{
    marker[0].image_angle = 180;
    marker[1].image_angle = 0;
    marker[0].y = y - _dist - 1;
    marker[1].y = y + _dist + 3;
    marker[0].x = x - 1;
    marker[1].x = x + 3;
}
if (distance > 0)
    obj_growtangle.x = -9999;
else
    obj_growtangle.x = obj_growtangle.xstart;
