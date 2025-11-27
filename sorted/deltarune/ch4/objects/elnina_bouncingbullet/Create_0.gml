event_inherited();
destroyonhit = 0;
wall_destroy = 0;
bounce_count = 0;
bounce = 0;
bounce_buffer = 0;
firstball = false;
if (instance_number(obj_elnina_bouncingbullet) == 1)
    firstball = true;
hspeed = (2 + random(3)) * choose(-1, 1);
vspeed = -4;
alarm[0] = 8;
image_xscale = 1;
image_yscale = 1;
image_alpha = 0;
difficulty = 0;
boss = 0;
if (instance_find(obj_elnina_bouncingbullet, 0) == id)
    boss = 1;
bounce_count = 60;
ballvar = 0;
index = 0;
depth = -10;
timerlength = 0;
if (i_ex(obj_elnina_lanino_rematch_controller))
{
    obj_elnina_lanino_rematch_controller.ballvar++;
    if (obj_elnina_lanino_rematch_controller.ballvar == 1)
        sprite_index = spr_ball_elnina;
    if (obj_elnina_lanino_rematch_controller.ballvar == 2)
        sprite_index = spr_ball_lanino;
    if (obj_elnina_lanino_rematch_controller.ballvar == 2)
        obj_elnina_lanino_rematch_controller.ballvar = 0;
}
