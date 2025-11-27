if (!on && (instance_exists(obj_mainchara) || instance_exists(obj_climb_kris)))
{
    var _char = instance_exists(obj_climb_kris) ? 27 : 1049;
    var _xx = _char.bbox_left + (_char.sprite_width / 2);
    var _yy = _char.bbox_bottom - (_char.sprite_height / 2);
    var _top = bbox_top;
    var _bottom = bbox_bottom;
    var _left = bbox_left;
    var _right = bbox_right;
    var trig = false;
    if (trigger_horizontal != -1 && abs(_xx - x) < trigger_horizontal && _yy > _top && _yy < _bottom)
    {
        trig = true;
        show_debug_message(string(abs(_xx - x)) + " , " + string(_yy) + "/" + string(_top) + "/" + string(_bottom));
    }
    if (trigger_vertical != -1 && abs(_yy - y) < trigger_vertical && _xx > _left && _xx < _right)
        trig = true;
    if (trigger_radius != -1 && point_distance(x, y, _xx, _yy) < trigger_radius)
        trig = true;
    if (trig == true)
    {
        on = true;
        image_speed = final_speed;
        if (allowed_to_sound)
        {
            snd_stop(snd_wing);
            snd_play(snd_wing, 0.5);
        }
    }
}
