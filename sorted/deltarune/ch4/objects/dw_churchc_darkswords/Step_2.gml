if (con < 99)
{
    var _animspeed = 0.30000000000000004;
    var _kristarget = 1049;
    var _hx = obj_mainchara.x + 12;
    var _hy = obj_mainchara.y + 40;
    var _cx = camerax();
    var _cy = cameray();
    var _moving = 0;
    if (con == 1)
    {
        with (obj_mainchara)
            sprite_index = rsprite;
    }
    if (con == 7)
    {
        with (obj_mainchara)
        {
            if (other.wound_state == false)
                sprite_index = spr_kris_walk_up_windy;
            global.facing = 2;
            mask_index = spr_krisd_dark_extendedhitbox;
            if (other.friends_protecc_state > 2)
                mask_index = spr_krisd_dark_extendedhitboxB;
            if (other.wrappedup)
                mask_index = spr_krisu_dark;
            if (fun == 1 && sprite_index == spr_kris_walk_up_windy)
            {
                if (x != xprevious || y != yprevious)
                {
                    if (y > yprevious)
                    {
                        image_index -= _animspeed;
                        _moving = -1;
                    }
                    else
                    {
                        image_index += _animspeed;
                        _moving = 1;
                    }
                }
            }
        }
    }
    with (ra_hunch)
    {
        if (other.sync_friends)
        {
            var _xTo = obj_mainchara.x + offsetx;
            var _yTo = obj_mainchara.y + offsety;
            x = _xTo;
            y = _yTo;
            if (other.con >= 7)
                image_index += (_moving * _animspeed);
            else
                image_index = obj_mainchara.image_index;
            image_speed = 0;
        }
        scr_depth();
        if (other.con < 2)
            depth = obj_mainchara.depth - 2;
    }
    with (su_hunch)
    {
        if (other.sync_friends)
        {
            var _xTo = obj_mainchara.x + offsetx;
            var _yTo = obj_mainchara.y + offsety;
            x = _xTo;
            y = _yTo;
            if (other.con >= 7)
                image_index += (_moving * _animspeed);
            else
                image_index = obj_mainchara.image_index;
            image_speed = 0;
        }
        scr_depth();
        if (other.con < 2)
            depth = obj_mainchara.depth - 1;
    }
    if (i_ex(cutscene_master) && i_ex(kr_actor))
    {
        _kristarget = kr_actor;
        _hx = kr_actor.x + 12;
        _hy = kr_actor.y + 40;
        with (light_player)
            target = other.kr_actor;
        with (light_player_b)
            target = other.kr_actor;
        var _su_actor = su_actor;
        var _ra_actor = ra_actor;
        with (su_hunch)
        {
            sprite_index = _su_actor.sprite_index;
            image_index = _su_actor.image_index;
            image_speed = _su_actor.image_speed;
            x = _su_actor.x;
            y = _su_actor.y;
            depth = _su_actor.depth - 1;
            var _xx = -1;
            var _yy = -1;
            if (i_ex(obj_jump_to_point) && other.friends_protecc_state > 4)
            {
                with (obj_jump_to_point)
                {
                    with (body_obj)
                    {
                        _xx = x;
                        _yy = y;
                    }
                }
            }
            if (_xx != -1)
            {
                x = _xx;
                y = _yy;
            }
        }
        with (ra_hunch)
        {
            sprite_index = _ra_actor.sprite_index;
            image_index = _ra_actor.image_index;
            image_speed = _ra_actor.image_speed;
            x = _ra_actor.x;
            y = _ra_actor.y;
            depth = _ra_actor.depth - 1;
        }
    }
    else
    {
        with (light_player)
            target = 1049;
        with (light_player_b)
            target = 1049;
    }
    with (flash)
    {
        x = _hx + 8;
        y = _hy + 8;
    }
    with (fakesoul)
    {
        x = _hx;
        y = _hy;
    }
    if (i_ex(super_darkness))
    {
        with (super_darkness)
        {
            x = _cx - 100;
            y = _cy - 100;
        }
    }
    with (kr_special)
    {
        x = _kristarget.x;
        y = _kristarget.y;
        sprite_index = _kristarget.sprite_index;
        image_index = _kristarget.image_index;
        depth = _kristarget.depth - 1;
        var _kx = -1;
        var _ky = -1;
        var _kd = -1;
        if (i_ex(obj_jump_to_point) && other.friends_protecc_state == 3)
        {
            with (obj_jump_to_point)
            {
                with (body_obj)
                {
                    _kx = x;
                    _ky = y;
                    _kd = depth;
                }
            }
        }
        if (_kx != -1)
        {
            x = _kx;
            y = _ky;
            depth = _kd - 1;
        }
    }
}
