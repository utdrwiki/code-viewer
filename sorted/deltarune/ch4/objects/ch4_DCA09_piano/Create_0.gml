piano_song[0] = snd_init("kris_piano_lower.ogg");
piano_song[1] = audio_play_sound(piano_song[0], 90, 0);
kris_marker = scr_dark_marker(x, y, spr_kris_piano_full);
with (kris_marker)
    scr_depth();
piano_start = true;
piano_timer = 0;
piano_finish = false;
