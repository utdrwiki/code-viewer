timer = 0;
timer2 = 0;
type = 0;
image_xscale = 2;
image_yscale = 2;
image_speed = 1/3;
if (i_ex(obj_sound_of_justice_enemy))
    image_blend = c_black;
with (obj_hammer_of_justice_enemy)
    image_alpha = 0;
with (obj_sound_of_justice_enemy)
    image_alpha = 0;
scr_oflash();
snd_play(snd_boost);
