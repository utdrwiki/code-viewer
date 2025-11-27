instance_activate_all();
scr_chefs_start(opt[0]);
if (opt[1] > 0)
    snd_play(minigame_kart);
instance_destroy();
