if (act == 0)
{
    scr_sparkle(12);
    snd_play(snd_pop);
    with (obj_mike_minigame_controller)
        myscore += 1;
    instance_destroy();
}
