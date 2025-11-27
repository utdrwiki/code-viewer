if (action < 4)
{
    sprite_index = spr_mike_cat_dance;
    image_blend = c_white;
    image_speed = 1;
    image_index = 0;
    speed = 0;
    meow = snd_play(snd_meow);
    sound_pitch(meow, random_range(0.5, 1.5));
    scr_doom(self, 30);
    scr_sparkle(8);
    with (obj_mike_minigame_controller)
    {
        myscore += 10;
        other.image_alpha = 0.25;
        var _a = instance_create(other.x, other.y, obj_gravity_text);
        _a.str = "10";
    }
    action = 4;
    active = false;
}
