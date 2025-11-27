image_xscale = 2;
image_yscale = 2;
depth = -1;
vspeed = -12;
fixate = -4;
fixate_y = 0;
falling = false;
fallspeed = 3;
caught = false;
thrown = false;
eaten = 0;
firedie = true;
gameover = false;
goto_susie = false;
image_speed = 0;
food_type = choose(0, 1, 2);
image_index = food_type;
on_fire = false;
img = irandom(3);
floor_y = obj_chefs_kris.ystart + 40;
if (i_ex(obj_chefs_init))
{
    depth = obj_chefs_init.depth - 10;
    if (i_ex(obj_tenna_minigame_ui))
        depth = obj_tenna_minigame_ui.depth;
}
