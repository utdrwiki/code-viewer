timer = 0;
full_timer = 0;
hammer_timer = 0;
hammer_timer_goal = 10;
hammer_counter = 0;
hammer_phase = 0;
ending_counter = 0;
z = 0;
my_flash = -1;
anchor_x = x;
anchor_y = y;
scr_darksize();
image_speed = 0.5;
snd_play(snd_gerlaugh_clear, 1, 1.1);
with (obj_hammer_of_justice_enemy)
    visible = false;
global.turntimer = 9999;
