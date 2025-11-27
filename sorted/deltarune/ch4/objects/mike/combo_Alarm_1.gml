room_speed = 30;
mus_volume(global.batmusic[1], 1, 0);
marker = scr_dark_marker(x, y, spr_realisticexplosion);
marker.image_speed = 0.5;
marker.depth = -10;
scr_doom(marker, 32);
snd_play(snd_badexplosion);
