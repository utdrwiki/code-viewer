scr_board_enemy_init();
hurt_sprite = spr_board_deer_left_hurt;
show_outline = false;
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
hp = 999;
active_hitbox = false;
image_speed = 0;
timer = 0;
flashtimer = 0;
blockinteract = 0;
ominoussound = 0;
follow = false;
target = 8;
for (i = 0; i < 75; i += 1)
{
    remx[i] = 0;
    remy[i] = 0;
    facingdir[i] = 3;
}
path = path_add();
is_moving = false;
is_moving_timer = 0;
path_target_x = -1;
path_target_y = -1;
allow_diagonals = true;
hurttimer2 = 0;
