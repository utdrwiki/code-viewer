if (global.interact != 0)
    exit;
if (act == 0 && !obj_mike_controller.battle_active && !i_ex(obj_writer))
{
    act = 1;
    meow = snd_play(snd_meow);
    sound_pitch(meow, random_range(0.5, 1.5));
    image_index = 1;
    with (other)
    {
        scr_sparkle(8);
        instance_destroy();
    }
}
