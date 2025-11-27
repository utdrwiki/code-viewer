if (state == UnknownEnum.Value_3)
{
    var _inAir = height > 0;
    height = obj_susiezilla.height;
    y = obj_susiezilla.y - 2;
    var _susiedir = sign(obj_susiezilla.image_xscale);
    x = obj_susiezilla.x + (24 * _susiedir);
    depth = obj_susiezilla.depth + 2;
    image_xscale = -obj_susiezilla.image_xscale;
    if (obj_susiezilla.suplexCon == 2)
        sprite_index = spr_susiezilla_shadowguy_grab_rise;
    else if (obj_susiezilla.suplexCon == 3)
        sprite_index = spr_susiezilla_shadowguy_grab_fall;
    if (_inAir && height <= 0)
    {
        scr_bounce_land(2);
        hp = 0;
        var _explosion = instance_create(x, y, obj_susiezilla_explosion);
        _explosion.reflected = true;
        _explosion.silent = true;
        snd_play_pitch(snd_explosion_firework, 0.6);
        with (_explosion)
        {
            scr_depth_pivot();
            depth -= 10;
        }
        for (i = 0; i < 6; i++)
        {
            var _xx = lengthdir_x(50, i * 60);
            var _yy = lengthdir_y(50, i * 60);
            _yy /= 2;
            _explosion = instance_create(x + _xx, y + _yy, obj_susiezilla_explosion);
            _explosion.reflected = true;
            _explosion.silent = true;
            with (_explosion)
            {
                scr_depth_pivot();
                depth -= 10;
            }
        }
        state = UnknownEnum.Value_7;
        fall_speed = -9;
    }
}
event_inherited();
if (height > 0 || fall_speed != 0)
{
    shadow.visible = true;
    shadow.x = x;
    shadow.y = y;
    shadow.depth = depth + 1000;
}
else
{
    shadow.visible = false;
}

enum UnknownEnum
{
    Value_3 = 3,
    Value_7 = 7
}
