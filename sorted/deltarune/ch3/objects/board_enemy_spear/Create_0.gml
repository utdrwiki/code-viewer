image_xscale = 2;
image_yscale = 2;
image_speed = 0;
depth = 100001;
timer = 0;
con = 0;
damage = 1;
mysolid = 0;
active_hitbox = true;
updatetimer = 0;
spd = 10;
acc = 0;
destroyonhit = false;
for (i = 0; i < 5; i += 1)
{
    remx[i] = x;
    remy[i] = y;
}
snd_stop(snd_board_splash);
snd_play(snd_board_splash);
krisonly = false;
