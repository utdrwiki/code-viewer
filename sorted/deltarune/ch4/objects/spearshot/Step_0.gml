if (!i_ex(obj_heart) || !i_ex(obj_spearblocker) || global.turntimer < 1)
{
    instance_destroy();
    exit;
}
if (!i_ex(obj_heart))
{
    instance_destroy();
    exit;
}
if (frozentimer > 0)
{
    frozentimer--;
    exit;
}
if (bouncespear > 0)
{
    if (bouncespearcon == 0)
    {
        sprite_index = spr_bounce_shell_idle;
        if (bouncespear == 2)
        {
            if (bouncespeardir == 0)
                sprite_index = spr_bounce_shell_idle;
            else
                sprite_index = spr_bounce_shell_idle;
        }
        image_xscale = 1.5;
        image_yscale = 1.5;
        savedir = direction;
        bouncespearcon = -1;
        testcon = 0;
    }
    if (bouncespearcon == 1)
    {
        image_index++;
        bouncespeartimer++;
        if (bouncespeartimer == 5)
        {
            bouncespearcon = 2;
            fakespeed = -20;
            grav = 1.2;
            if (bouncespear == 1)
                sprite_index = spr_bounce_shell_idle;
            if (bouncespear == 2)
            {
                if (sprite_index != spr_bounce_shell_hit_center)
                {
                    image_index = 1;
                    sprite_index = spr_bounce_shell_hit_center;
                    if (direction == 270)
                        y -= 16;
                    if (direction == 180)
                        x -= 16;
                    if (direction == 90)
                        y += 16;
                    if (direction == 0)
                        x += 16;
                }
                fakespeed = -17;
                grav = 1;
                if (hitstopbounce == 1)
                {
                    fakespeed = -19;
                    grav = 1.25;
                }
                if (fastbounce == 1)
                {
                    fakespeed = -38;
                    grav = 6;
                }
            }
            if (slowbounce == 1)
            {
                fakespeed = -10;
                grav = 0.35;
            }
            if (slowbounce == 2)
            {
                fakespeed = -10;
                grav = 0.25;
            }
            if (slowbounce == 3)
            {
                fakespeed = -10;
                grav = 0.2;
            }
            if (slowbounce == 4)
            {
                fakespeed = -11;
                grav = 0.24;
            }
            bouncespeartimer = 0;
        }
        else
        {
            exit;
        }
    }
    else
    {
        hurtsquish = false;
    }
    if (bouncespearcon == 2)
    {
        x3++;
        if (bouncespear == 1)
        {
            x = round(obj_spearblocker.x + lengthdir_x(len, direction + 180));
            y = round(obj_spearblocker.y + lengthdir_y(len, direction + 180));
        }
        if (bouncespear == 2)
        {
            bouncespeartimer++;
            fakespeed += grav;
            len -= fakespeed;
            var duration = 34;
            if (hitstopbounce == 1)
                duration = 30;
            if (fastbounce == 1)
                duration = 12;
            if (slowbounce == 1)
            {
                duration = 60;
                if (hitstopbounce == 1)
                    duration = 54;
            }
            if (slowbounce == 2)
            {
                duration = 80;
                if (hitstopbounce == 1)
                    duration = 74;
            }
            if (slowbounce == 3)
            {
                duration = 100;
                if (hitstopbounce == 1)
                    duration = 94;
            }
            if (slowbounce == 4)
            {
                duration = 110;
                if (hitstopbounce == 1)
                    duration = 104;
            }
            duration += testcon;
            spinindex = (bouncespeartimer / duration) * 14.5;
            var _savedir;
            if (bouncespeardir == 0)
            {
                _savedir = savedir + 270;
                if (bouncespeartimer <= duration)
                    _savedir = lerp(savedir + 180, savedir + 270, bouncespeartimer / duration);
                direction = savedir + 90;
            }
            if (bouncespeardir == 180)
            {
                _savedir = savedir + 90;
                if (bouncespeartimer <= duration)
                    _savedir = lerp(savedir + 180, savedir + 90, bouncespeartimer / duration);
                direction = savedir - 90;
            }
            x = obj_spearblocker.x + lengthdir_x(len, _savedir);
            y = obj_spearblocker.y + lengthdir_y(len, _savedir);
        }
    }
}
if (fadespear == 1)
{
    image_alpha += 0.1;
    fadespeartimer++;
    if (fadespeartimer == 1)
    {
        savedir = direction;
        savex = x;
        savey = y;
        type = choose(0, 1);
    }
    if (image_angle == 0)
    {
        if (type == 1)
            y = lerp(savey + fadespeardist, savey, fadespeartimer / fadespeartimermax);
        else
            y = lerp(savey - fadespeardist, savey, fadespeartimer / fadespeartimermax);
    }
    if (image_angle == 90)
    {
        if (type == 1)
            x = lerp(savex + fadespeardist, savex, fadespeartimer / fadespeartimermax);
        else
            x = lerp(savex - fadespeardist, savex, fadespeartimer / fadespeartimermax);
    }
    if (image_angle == 180)
    {
        if (type == 1)
            y = lerp(savey + fadespeardist, savey, fadespeartimer / fadespeartimermax);
        else
            y = lerp(savey - fadespeardist, savey, fadespeartimer / fadespeartimermax);
    }
    if (image_angle == 270)
    {
        if (type == 1)
            x = lerp(savex + fadespeardist, savex, fadespeartimer / fadespeartimermax);
        else
            x = lerp(savex - fadespeardist, savex, fadespeartimer / fadespeartimermax);
    }
    if (fadespeartimer == fadespeartimermax)
    {
        speed = 0;
        direction = savedir;
        fakespeed = fadespeed;
        fadespeartimer = 0;
        fadespear = 0;
        init = 1;
    }
    exit;
}
if (fadespear == 3)
{
    if (image_alpha == 0)
        savedir = direction;
    image_alpha = lerp(image_alpha, 1.8, 0.16);
    fadespeartimer++;
    if (fadespeartimer == 1)
        fakespeed = -0.5;
    if (fadespeartimer == 20)
        fakespeed = 0;
    if (fadespeartimer == (fadewaitmax - 12))
    {
        snd_play_pitch(snd_bell_bounce_short, 1.3);
        sprite_index = spr_spear_arrow_highlight;
        flashalpha = 1;
    }
    if (fadespeartimer == fadewaitmax)
    {
        fakespeed = 15;
        init = 1;
    }
    if (fadespeartimer < fadewaitmax)
    {
        len -= fakespeed;
        x = obj_spearblocker.x + lengthdir_x(len, direction + 180);
        y = obj_spearblocker.y + lengthdir_y(len, direction + 180);
        exit;
    }
}
if (fadespear == 4)
{
    image_alpha += 0.1;
    fadespeartimer++;
    if (fadespeartimer == 1)
        fakespeed = -0.5;
    if (fadespeartimer == 20)
        fakespeed = 0;
    if (fadespeartimer == (fadewaitmax - 12))
    {
        snd_play_pitch(snd_bell_bounce_short, 1.3);
        sprite_index = spr_spear_arrow_highlight;
        flashalpha = 1;
    }
    if (fadespeartimer == fadewaitmax)
    {
        fakespeed = 15;
        init = 1;
    }
    if (fadespeartimer < fadewaitmax)
    {
        if (len < 190)
            direction++;
        else
            direction--;
        len -= fakespeed;
        x = obj_spearblocker.x + lengthdir_x(len, direction + 180);
        y = obj_spearblocker.y + lengthdir_y(len, direction + 180);
        exit;
    }
}
var rotateradius = 90;
if (giant || redhammer)
    rotateradius = 70;
var _a = 0;
if (bouncespearcon == 2 && bouncespear == 2)
    _a = 1;
if ((special == 0 || (special != 0 && len > rotateradius)) && _a == 0)
{
    fakespeed += grav;
    len -= fakespeed;
}
if (special != 0 && len <= rotateradius)
{
    len = rotateradius;
    var _special = special;
    if (_special == 360)
        _special = 0;
    repeat (20)
    {
        var _dir = direction - _special;
        var _angledifference = _dir;
        if (abs(_dir) > 180)
        {
            if (direction > _special)
                _angledifference = -1 * ((360 - direction) + _special);
            else
                _angledifference = (360 - _special) + direction;
        }
        if (direction == _special)
        {
        }
        else if (_angledifference > 2)
        {
            direction -= 1;
        }
        else if (_angledifference < 2)
        {
            direction += 1;
        }
        else
        {
            direction = _special;
        }
        if (direction > 360)
            direction -= 360;
        if (direction < 0)
            direction += 360;
        if (_special == direction)
            special = 0;
    }
}
if (redhammer != 0)
{
    if (i_ex(obj_spearblocker))
    {
        spearblockerx = obj_spearblocker.x;
        spearblockery = obj_spearblocker.y;
    }
    x1 = spearblockerx + lengthdir_x(len, direction + 180);
    y1 = spearblockery + lengthdir_y(len, direction + 180);
}
else if (i_ex(obj_spearblocker))
{
    x1 = obj_spearblocker.x + lengthdir_x(len, direction + 180);
    y1 = obj_spearblocker.y + lengthdir_y(len, direction + 180);
}
if (init == 0)
{
    init = 1;
    dir2 = direction + 90;
    len2 = len + 50;
}
if (timer < 25 && swingaround == true)
{
    timer++;
    dir2 = lerp(dir2, direction + 180, timer / 25);
    len2 = lerp(len2, len, timer / 25);
    x = obj_spearblocker.x + lengthdir_x(len2, dir2);
    y = obj_spearblocker.y + lengthdir_y(len2, dir2);
}
else if (bouncespearcon != 2)
{
    x = x1;
    y = y1;
}
if (len < 50)
    event_user(0);
