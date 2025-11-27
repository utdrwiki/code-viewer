con = 0;
timer = 0;
encounterno = 152;
encounterflag = 1796;
depth = 1000;
auraalpha = 0;
drawsiner = 0;
spd = 0;
krismarker = 0;
myxoff = 48;
myyoff = 40;
image_speed = 0;
foughtbefore = false;
if (global.flag[encounterflag] != 0)
    foughtbefore = true;
printval("foughtbefore");
if (global.flag[encounterflag] == 1)
    instance_destroy();
