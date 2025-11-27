timer = 0;
con = 0;
image_xscale = 2;
image_yscale = 2;
x = obj_hammer_of_justice_enemy.x;
y = obj_hammer_of_justice_enemy.y;
with (obj_hammer_of_justice_enemy)
    visible = false;
with (obj_battlecontroller)
    disableitembutton = 1;
snd_stop(motor_swing_down);
snd_play_pitch(motor_swing_down, 1.4);
