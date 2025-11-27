image_xscale = 2;
image_yscale = 2;
depth = -1;
vspeed = -12;
if (obj_chefs_game.microgame == 0)
{
    gravity = 0.3;
    gravity_direction = 180;
}
falling = 0;
fallspeed = 3;
stationary = false;
jumpover = 0;
pcheck = -4;
fallspeed = 3;
image_speed = 1;
image_yscale = 2;
depth = -5;
side = -1;
flamewhip = false;
floor_y = obj_chefs_kris.ystart + 50;
minigameinsanity = false;
forcefall = false;
extrafar = false;
if (i_ex(obj_chefs_init))
    depth = obj_chefs_init.depth - 10;
