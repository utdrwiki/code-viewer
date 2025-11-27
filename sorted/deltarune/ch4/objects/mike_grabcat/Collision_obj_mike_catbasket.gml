other.act = 1;
other.timer = 0;
other.cats += 1;
with (obj_mike_controller)
{
    if (hand_target == other.id)
        hand_target = -1;
    hand_type = 0;
}
if (other.type == 1)
    other.move = true;
scr_sparkle(8);
with (obj_mike_minigame_controller)
    myscore += 100;
sound_play(snd_spell_pacify);
instance_destroy();
