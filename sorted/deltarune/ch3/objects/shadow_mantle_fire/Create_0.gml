image_speed = 0.25;
image_xscale = 2;
image_yscale = 2;
alpha_timer = 0;
visible = false;
depth = obj_mainchara_board.depth - 1;
timer = 0;
con = 0;
_type = 0;
active_hitbox = false;
destroyonhit = false;
dir = 1;
rotator_target = -1;
len = 40;
len_speed = 0;
place = 0;
place_speed = 2;
damage = 2;
mysolid = 0;
snd_stop(snd_board_torch);
snd_play(snd_board_torch);
for (i = 0; i < 5; i += 1)
{
    remx[i] = x;
    remy[i] = y;
}
krisonly = false;
