scr_flag_set(1579, scr_flag_get(1579) + 1);
snd_play_x(snd_bell, 0.8, 1.5 + random(0.6));
bell_target_angle = (obj_homealone_heart.x < x) ? 45 : -45;
bell_bonk = true;
