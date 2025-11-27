event_inherited();
slowing = 30;
owner = -4;
damage = 206;
element = 5;
grazepoints = 12;
image_yscale = 0;
alarm[0] = 1;
destroyonhit = 0;
image_alpha = 0;
timer = 0;
_snd = -1;
nosfx = false;
max_old = 3;
old_x[0] = x;
old_y[0] = y;
old_angle[0] = image_angle;
for (i = 1; i < max_old; i++)
{
    old_x[i] = old_x[i - 1];
    old_y[i] = old_y[i - 1];
    old_angle[i] = old_angle[i - 1];
}
speed_gain = 0.4;
finalsword = false;
