scr_enemy_drawhurt_generic();
scr_enemy_drawidle_generic(0.16666666666666666);
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
if (hurttimer == 29)
{
    snd_stop(snd_spawn_weaker);
    snd_play(snd_spawn_weaker);
}
