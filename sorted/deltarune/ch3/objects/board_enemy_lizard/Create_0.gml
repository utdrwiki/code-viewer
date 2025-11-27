scr_board_enemy_init();
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
dietimer = irandom(5);
dontmove = false;
hp = 2;
hpmax = 2;
jumpedrecentlytimer = 0;
image_speed = 0.1;
if (type == 1)
{
    spd = 5;
    type = 1;
    sprite_index = spr_board_lizard_l_alt;
}
if (type == 2)
{
    spd = 6;
    type = 2;
    sprite_index = spr_board_lizard_l_jumpy;
}
reticle = instance_create(x, y, obj_marker);
reticle.sprite_index = spr_board_throw_reticle;
reticle.visible = false;
reticle.image_xscale = 2;
reticle.image_yscale = 2;
reticle.depth = 999990;
