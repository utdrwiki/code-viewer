if (buffer < 0)
{
    snd_play(snd_spell_pacify, 1, 1 + (level * 0.02));
    var _a = instance_create_depth(other.x, other.y, depth, obj_gold_cat);
    _a.speed = speed / 2;
    _a.direction = direction;
    _a.friction = 0.1;
    _a.image_angle = image_angle;
    _a.level = level + 1;
    scr_sparkle_colour(8, 65535);
    var _b = instance_create_depth(other.x, other.y, depth, obj_gravity_text);
    _b.image_blend = c_yellow;
    _b.str = stringsetloc("LEVEL ", "obj_gold_cat_slash_Collision_obj_blue_cat_gml_18_0") + string(level + 1);
    _b.small = true;
    with (obj_mike_controller)
    {
        if (hand_target == other.id)
        {
            hand_target = _a;
            _a.action = 1;
            _a.grab_snd = 1;
        }
    }
    with (other)
        instance_destroy();
    instance_destroy();
}
