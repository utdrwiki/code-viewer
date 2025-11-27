instance_create_depth(0, 0, 1000, obj_mike_minigame_bg);
instance_create_depth(0, 0, 0, obj_mike_minigame_start);
global.flag[9] = 2;
if (sprite_index == spr_mike_s)
    global.batmusic[0] = snd_init("spamton_dance.ogg");
else if (sprite_index == spr_mike_m)
    global.batmusic[0] = snd_init("muffled_rain.ogg");
else
    global.batmusic[0] = snd_init("mike.ogg");
snd_volume(global.currentsong[1], 0, 20);
with (obj_mike_controller)
    hand_type = 0;
