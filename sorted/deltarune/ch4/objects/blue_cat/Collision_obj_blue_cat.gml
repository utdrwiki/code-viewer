if (x < other.x)
{
    snd_play(snd_spell_pacify);
    var _a;
    with (other)
    {
        _a = instance_create_depth(x, y, depth, obj_gold_cat);
        scr_sparkle_colour(8, 65535);
        instance_destroy();
    }
    with (obj_mike_controller)
    {
        hand_target = _a;
        _a.action = 1;
        _a.grab_snd = 1;
    }
    instance_destroy();
}
