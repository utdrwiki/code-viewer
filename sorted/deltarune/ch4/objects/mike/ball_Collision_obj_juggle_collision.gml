if (act == 0)
{
    var _width = 32 + (obj_mike_controller.line_width / 2);
    var _targetx = (x < (room_width / 2)) ? ((room_width / 2) + _width) : ((room_width / 2) - _width);
    var _direction = point_direction(x, obj_mike_controller.y, _targetx, y - 400);
    var _vs = 7;
    motion_set(_direction, _vs);
    gravity = 0;
    alarm[0] = 50;
    act = 1;
    wobble = 15;
    var _a = snd_play(snd_wobble);
    snd_pitch(_a, 1.5);
    hue = irandom(255);
    while (abs(last_hue - hue) < 40)
        hue = irandom(255);
    last_hue = hue;
    image_angle = random(360);
    image_blend = make_colour_hsv(hue, 255, 255);
    _a = instance_create(x, y, obj_healanim);
    _a.target = id;
    _a.particlecolor = image_blend;
    with (_a)
    {
        t = 1;
        sw = sprite_width;
        sh = sprite_height;
    }
    with (obj_mike_minigame_controller)
        myscore += 100;
}
