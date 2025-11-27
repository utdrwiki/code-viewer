scr_board_enemy_reset();
bulletimer = choose(-30, -20, 10);
lastattack = 4;
spd = 5;
startx = x;
starty = y;
targetx = -1;
targety = -1;
fakey = -15;
savedepth = depth;
delay = 0;
image_speed = 0.1;
sprite_index = spr_board_lizard_l;
if (type == 1)
    sprite_index = spr_board_lizard_l_alt;
if (type == 2)
    sprite_index = spr_board_lizard_l_jumpy;
