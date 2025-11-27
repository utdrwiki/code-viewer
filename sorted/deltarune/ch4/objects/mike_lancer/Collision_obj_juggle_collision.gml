if (act == 0)
{
    var _width = 32 + (obj_mike_controller.line_width / 2);
    var _targetx = (x < (room_width / 2)) ? ((room_width / 2) + _width) : ((room_width / 2) - _width);
    var _direction = point_direction(x, obj_mike_controller.y, _targetx, y - 200);
    var _vs = 7 + hits;
    motion_set(_direction, _vs);
    gravity = 0;
    alarm[0] = 30 - (hits * 3);
    act = 1;
    wobble = 15;
    hits++;
    if (hits < max_hits)
        snd_play(snd_lancer_cough);
    else
        snd_play(snd_lancerlaugh);
    var _a = instance_create(x, y, obj_healanim);
    _a.target = id;
    _a.particlecolor = c_white;
    with (_a)
    {
        t = 1;
        sw = sprite_width;
        sh = sprite_height;
    }
    with (obj_mike_minigame_controller)
        myscore += 50;
}
