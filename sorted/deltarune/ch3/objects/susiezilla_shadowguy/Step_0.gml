if (state != UnknownEnum.Value_7)
{
    px = 0;
    py = 0;
}
if (state != lastState)
    event_user(0);
if (state == UnknownEnum.Value_0)
{
}
else if (state == UnknownEnum.Value_1)
{
    if (x < (camerax() + 100))
        px = 6;
    else if (x > (camerax() + 540))
        px = -6;
    else
        state = UnknownEnum.Value_2;
}
else if (state == UnknownEnum.Value_2)
{
    var _susieDistance = abs(obj_susiezilla.x - x);
    var _susieYDiff = abs(obj_susiezilla.y - y);
    if (shuffleCount == 0)
    {
        if (_susieDistance < 80 && _susieYDiff <= 10)
        {
            state = UnknownEnum.Value_5;
            exit;
        }
        else if (_susieDistance > 60)
        {
            px = sign(obj_susiezilla.x - x) * 6;
        }
        if (_susieDistance < 400 && _susieYDiff > 10)
            py = sign(obj_susiezilla.y - y) * 3;
    }
    else
    {
    }
    if (px != 0)
        image_xscale = 2 * sign(px);
}
else if (state == UnknownEnum.Value_4)
{
    sprite_index = spr_susiezilla_shadowguy_punch;
    image_speed = 0;
    if (con == 0)
    {
        image_index = 0;
        timer++;
        if (timer >= 5)
        {
            con++;
            timer = 0;
        }
    }
    if (con == 1)
    {
        image_index = 1;
        timer++;
        if (timer >= 5)
        {
            con++;
            timer = 0;
        }
    }
    if (con == 2)
    {
        image_index = 2;
        timer++;
        if (punchCount < 2 && timer >= 10)
        {
            punchCount++;
            con = 0;
            timer = 0;
        }
        else if (punchCount == 2 && timer >= 20)
        {
            con = 0;
            timer = 0;
            state = UnknownEnum.Value_2;
        }
    }
}
else if (state == UnknownEnum.Value_5)
{
    sprite_index = spr_susiezilla_shadowguy_kick;
    image_speed = 0;
    if (con == 0)
    {
        image_index = 0;
        timer++;
        if (timer >= 11)
        {
            con++;
            timer = 0;
        }
    }
    if (con == 1)
    {
        image_index = 1;
        timer++;
        if (timer == 1)
        {
            snd_stop(snd_motor_upper_quick);
            snd_play_pitch(snd_motor_upper_quick, 1.3);
            if (image_xscale > 0)
                hspeed = 16;
            else
                hspeed = -16;
            friction = 2;
        }
        if (timer >= 5)
        {
            con++;
            timer = 0;
        }
    }
    if (con == 2)
    {
        image_index = 0;
        timer++;
        if (punchCount == 0 && timer >= 20)
        {
            con = 0;
            timer = 0;
            state = UnknownEnum.Value_2;
        }
    }
}
else if (state == UnknownEnum.Value_3)
{
}
else if (state == UnknownEnum.Value_6)
{
    recoil += (timer * -sign(image_xscale));
    timer -= 1;
    if (sign(recoil) != -sign(image_xscale))
    {
        recoil = 0;
        timer = 0;
        con = 0;
        sprite_index = spr_susiezilla_shadowguy_idle;
        state = UnknownEnum.Value_0;
        state = UnknownEnum.Value_2;
    }
}
else if (state == UnknownEnum.Value_7)
{
    if (con < 2)
    {
        height -= fall_speed;
        fall_speed += 1;
        if (height <= 0)
        {
            height = 0;
            if (con < 1)
                fall_speed *= -0.5;
            else
                fall_speed = 0;
            _shake = instance_create(x, y, obj_shake);
            if (i_ex(_shake))
            {
                _shake.shakex = 0;
                if (con > 0)
                    _shake.shakey = 2;
            }
            if (con == 0)
                image_index++;
            con++;
            snd_play(snd_screenshake);
        }
    }
    else if (con == 2)
    {
        px = 0;
        timer++;
        if (timer >= 10)
            visible = timer % 2;
        if (timer >= 20)
            instance_destroy();
    }
}
x += px;
y += py;
if (px != 0 && state != UnknownEnum.Value_7 && state != UnknownEnum.Value_6)
    image_xscale = sign(px) * 2;

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7
}
