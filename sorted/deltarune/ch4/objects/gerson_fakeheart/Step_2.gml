if (global.turntimer < 0 || !i_ex(obj_heart))
{
    instance_destroy();
    exit;
}
if (con == 0)
{
    direction = directionhit;
    flashtimer = 61;
    con = 1;
}
if (con == 1)
{
    if (speed < 4)
    {
        image_angle = lerp(image_angle, 0, 0.3);
    }
    else
    {
        image_angle += (speed * 2);
        if (image_angle > 360)
            image_angle -= 360;
        dusttimer++;
        if ((dusttimer % 6) == 0)
        {
            inst = instance_create_depth(x, y, depth + 1, obj_animation);
            inst.sprite_index = spr_dust2;
            inst.image_index = 2;
            inst.image_speed = 0.25;
            inst.image_xscale = 1.1 + random(0.4);
            inst.image_yscale = 1.1 + random(0.4);
        }
    }
    var _box_left = scr_get_box(2);
    var _box_right = scr_get_box(0);
    var _box_top = scr_get_box(1);
    var _box_bottom = scr_get_box(3);
    if (i_ex(obj_gerson_growtangle))
    {
        _box_left = obj_gerson_growtangle.x1;
        _box_right = obj_gerson_growtangle.x2;
        _box_top = obj_gerson_growtangle.y1;
        _box_bottom = obj_gerson_growtangle.y2;
    }
    boxhittimer--;
    if (boxhittimer <= 0 && !i_ex(obj_gerson_growtangle) && (x < _box_left || x > (_box_right - 20) || y < _box_top || y > (_box_bottom - 20)))
    {
        boxhittimer = 3;
        snd_play(snd_impact);
        snd_play(snd_damage);
        if (x < _box_left)
        {
            if (direction > 180)
                direction = 315;
            else
                direction = 45;
            x = _box_left + 20;
            with (obj_growtangle)
            {
                var _shakeobj = instance_create(x, y, obj_shakeobj);
                _shakeobj.target = id;
                with (_shakeobj)
                    event_user(0);
            }
            with (obj_gerson_growtangle)
            {
                var _shakeobj = instance_create(x, y, obj_shakeobj);
                _shakeobj.target = id;
                with (_shakeobj)
                    event_user(0);
            }
        }
        if (x > (_box_right - 20))
        {
            if (direction > 0 && direction < 90)
                direction = 135;
            else
                direction = 225;
            x = _box_right - 60;
            with (obj_growtangle)
            {
                var _shakeobj = instance_create(x, y, obj_shakeobj);
                _shakeobj.target = id;
                with (_shakeobj)
                    event_user(0);
            }
            with (obj_gerson_growtangle)
            {
                var _shakeobj = instance_create(x, y, obj_shakeobj);
                _shakeobj.target = id;
                with (_shakeobj)
                    event_user(0);
            }
        }
        if (y < _box_top)
        {
            if (direction > 90)
                direction = 225;
            else
                direction = 315;
            y = _box_top + 20;
            with (obj_growtangle)
            {
                var _shakeobj = instance_create(x, y, obj_shakeobj_y);
                _shakeobj.target = id;
                with (_shakeobj)
                    event_user(0);
            }
            with (obj_gerson_growtangle)
            {
                var _shakeobj = instance_create(x, y, obj_shakeobj_y);
                _shakeobj.target = id;
                with (_shakeobj)
                    event_user(0);
            }
        }
        if (y > (_box_bottom - 20))
        {
            if (direction > 270)
                direction = 45;
            else
                direction = 135;
            y = _box_bottom - 40;
            with (obj_growtangle)
            {
                var _shakeobj = instance_create(x, y, obj_shakeobj_y);
                _shakeobj.target = id;
                with (_shakeobj)
                    event_user(0);
            }
            with (obj_gerson_growtangle)
            {
                var _shakeobj = instance_create(x, y, obj_shakeobj_y);
                _shakeobj.target = id;
                with (_shakeobj)
                    event_user(0);
            }
        }
    }
    if (speed <= 0)
        instance_destroy();
}
