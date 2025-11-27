function scr_spawn_cats(arg0, arg1)
{
    var _maxnum = arg0;
    for (i = 0; i < _maxnum; i++)
    {
        var _dir = -30 + irandom(240);
        var _dist = random_range(90, 200);
        var ob = instance_create_depth(obj_mike_controller.x + lengthdir_x(_dist, _dir), cameray() + (cameraheight() / 2) + lengthdir_y(_dist * 0.9, _dir), depth - 4, obj_mike_cat);
        with (ob)
        {
            wait = other.i * arg1;
            if (i_ex(obj_mike_minigame_controller))
            {
                mydist = irandom_range(40, 80);
                wait_time = 60;
            }
            var dir = point_direction(obj_mike_controller.x, obj_mike_controller.y, x, y);
            var dist = 0.75;
            x = obj_mike_controller.x + lengthdir_x(camerawidth() * dist, dir);
            y = cameray() + (cameraheight() / 2) + lengthdir_y(cameraheight() * dist, dir);
        }
    }
}

function scr_spawn_cats_random(arg0, arg1)
{
    var _maxnum = arg0;
    for (i = 0; i < _maxnum; i++)
    {
        var _dir = 20 + irandom(140);
        var _dist = random_range(90, 200);
        var ob = instance_create_depth(obj_mike_controller.x + lengthdir_x(_dist, _dir), cameray() + (cameraheight() / 2) + lengthdir_y(_dist * 0.9, _dir), depth - 4, obj_mike_cat);
        with (ob)
        {
            wait = other.i * arg1;
            var dir = point_direction(obj_mike_controller.x, obj_mike_controller.y, x, y);
            var dist = 1;
            x = obj_mike_controller.x + lengthdir_x(camerawidth() * dist, dir);
            y = cameray() + (cameraheight() / 2) + lengthdir_y(cameraheight() * dist, dir);
        }
    }
}

function scr_spawn_cats_falling(arg0, arg1, arg2)
{
    var _homing = irandom(arg2);
    for (i = 0; i < arg0; i++)
    {
        var _ob = instance_create_depth(camerax() + (camerawidth() / 2) + irandom_range(-100, 100), cameray() - 32 - (i * 90), depth - 10, obj_mike_spike);
        _ob.wait = (instance_number(obj_mike_spike) - 1) * max(1, arg1);
        while (point_distance(0, _ob.x, 0, lastx) < 32)
            _ob.x = camerax() + (camerawidth() / 2) + irandom_range(-100, 100);
        lastx = _ob.x;
        _homing += 1;
        if (_homing >= arg2)
        {
            _ob.homing = true;
            _homing = choose(0, 1);
        }
    }
}
