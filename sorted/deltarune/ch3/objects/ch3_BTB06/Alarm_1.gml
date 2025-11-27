global.flag[9] = 2;
global.batmusic[0] = snd_init("tenna_battle.ogg");
global.batmusic[1] = mus_loop(global.batmusic[0]);
global.batmusic[2] = snd_init("tenna_battle_guitar.ogg");
global.batmusic[3] = mus_loop(global.batmusic[2]);
mus_volume(global.batmusic[3], 0, 0);
scr_battle(121, 1, 0, 0, 0);
global.flag[9] = 1;
