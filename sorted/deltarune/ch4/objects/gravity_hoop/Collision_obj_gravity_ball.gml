if (other.score_buffer < 0 && other.vspeed > 0 && other.can_score)
{
    other.can_score = 0;
    snd_play(snd_bell, 0.8, 0.8 + random(0.2));
    score_timer = 10;
    if (instance_number(obj_gravity_ball) < 15)
    {
        with (other)
        {
            var _a = instance_create(x, y, obj_gravity_ball);
            _a.score_buffer = 15;
            _a.vspeed = vspeed / 2;
            _a.hspeed = hspeed / 2;
            _a.image_angle = image_angle;
        }
        with (obj_mike_minigame_controller)
            new_cat = 2.5;
    }
    var _score = 10 + (10 * other.level);
    var _mult = 1;
    with (other)
    {
        repeat (5 + floor(_score / 4))
            instance_create(x + random_range(-4, 4), y + random_range(-4, 4), obj_gravity_confetti);
    }
    if (obj_mike_minigame_controller.countdown > 0)
    {
        if (obj_mike_minigame_controller.combo_buffer > 25)
            obj_mike_minigame_controller.combo = 0;
        if (obj_mike_minigame_controller.combo > 0)
        {
            _mult += (0.5 * obj_mike_minigame_controller.combo);
            if (_mult >= 3)
                _mult = 3;
            _score *= max(1, _mult);
            if (_mult >= 2.5)
            {
                other.fever_timer = 10;
                snd_play(snd_badexplosion, 0.8, 0.8);
                scr_shakescreen(0, 8);
            }
        }
        var _newscore = ceil(_score);
        var _a = instance_create(other.x, other.y, obj_gravity_text);
        _a.str = string(_newscore);
        with (obj_mike_minigame_controller)
        {
            myscore += _newscore;
            combo_buffer = 0;
            combo++;
        }
        if (other.level == 0)
        {
            with (obj_mike_minigame_controller)
                countdown += 60;
        }
    }
    other.level++;
    if (other.level > 3)
        other.level = 3;
}
other.score_buffer = 3;
