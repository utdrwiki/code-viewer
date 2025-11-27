other.act = 1;
other.timer = 0;
other.cats += 1;
with (obj_mike_controller)
{
    if (hand_target == other)
    {
        hand_target = -1;
        hand_type = 0;
    }
}
other.last_cat_was_thrown = action == 5;
scr_sparkle(8);
snd_play(snd_meow, 1, 2);
instance_destroy();
