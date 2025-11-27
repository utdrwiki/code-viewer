image_xscale = 2;
image_yscale = 2;
depth = 900000;
timer = 0;
con = 0;
damage = 1;
mysolid = 0;
active_hitbox = false;
updatetimer = 0;
spd = 8;
destroyonhit = false;
image_speed = 0.1;
for (i = 0; i < 5; i += 1)
{
    remx[i] = x;
    remy[i] = y;
}
snd_stop(snd_board_torch);
snd_play(snd_board_torch);
direction = point_direction(x, y, obj_board_controller.kris_object.x + 16, obj_board_controller.kris_object.y + 16);
krisonly = false;
