scr_darksize();
scr_depth_alt();
con = 0;
siner = 0;
timer = 0;
mouthangle = 0;
laughing = false;
laughingtime = 0;
imgindex = 0;
jokes = [0, 1, 2, 3];
scr_array_shuffle(jokes);
imgind = 0;
mouthscale = 2;
if (global.flag[1637] == 2)
    instance_destroy();
