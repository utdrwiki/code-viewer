timer = 0;
con = 0;
siner = 0;
side = "above";
spot1x = 100;
spot2x = 200;
spot3x = 300;
obj_tenna_enemy.spotlightcount++;
if (obj_tenna_enemy.spotlightcount == 2)
{
    spot1x = 360;
    spot2x = 460;
    spot3x = 560;
    obj_tenna_enemy.spotlightcount = 0;
}
spot1angle = 0;
spot2angle = 0;
spot3angle = 0;
spot1targetangle = 0;
spot2targetangle = 0;
spot3targetangle = 0;
x = 640;
y = 40;
xstart = x;
ystart = y;
depth = -99999;
snd_play_x(snd_heavyswing, 1, 0.8);
snd_play_x(snd_heavyswing, 1, 0.8);
