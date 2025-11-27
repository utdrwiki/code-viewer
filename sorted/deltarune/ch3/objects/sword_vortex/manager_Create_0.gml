timer = 0;
siner = 0;
con = 0;
variant = 3;
firstsword = false;
swordcount = 0;
sinpower = 65;
sinspeed = 24;
startinglen = 70;
shrinkrate = 0;
multiswordmax = 0;
multiswordframes = 0;
multiswordcon = 0;
multiswordcount = 0;
centermoves = 0;
centermovescon = 0;
centermovestimer = 0;
movespeed = 60;
swordcirclecenterx = obj_growtangle.x;
swordcirclecentery = obj_growtangle.y;
startx = swordcirclecenterx;
starty = swordcirclecentery;
targetx = 0;
targety = 0;
setcount = 0;
for (i = 0; i < 50; i++)
    setdirection[i] = -1;
creatorid = -1;
creator = -1;
scr_bullet_init();
if (variant == 0)
{
    rate = 1;
    ratedecay = 0;
    rateminimum = 1;
    maxswords = 2;
    setdirection[1] = 0;
    setdirection[2] = 180;
    multiswordmax = 0;
    sinpower = 65;
    sinspeed = 24;
    startinglen = 70;
}
if (variant == 1)
{
    rate = 10;
    ratedecay = 0;
    rateminimum = 1;
    maxswords = 6;
    multiswordmax = 2;
    multiswordframes = 1;
    sinpower = 20;
    sinspeed = 18;
    startinglen = 90;
    shrinkrate = 0.15;
    setdirection[1] = 0;
    setdirection[2] = 180;
    setdirection[3] = 0;
    setdirection[4] = 180;
    setdirection[5] = 0;
    setdirection[6] = 180;
}
if (variant == 2)
{
    rate = 4;
    ratedecay = 0;
    rateminimum = 1;
    maxswords = 6;
    multiswordmax = 2;
    multiswordframes = 1;
    sinpower = 20;
    sinspeed = 26;
    startinglen = 70;
    setdirection[1] = 0;
    setdirection[2] = 180;
    setdirection[3] = 0;
    setdirection[4] = 180;
    setdirection[5] = 0;
    setdirection[6] = 180;
}
if (variant == 3)
{
    rate = 11;
    ratedecay = 0;
    rateminimum = 1;
    maxswords = 6;
    multiswordmax = 2;
    multiswordframes = 1;
    sinpower = 17;
    sinspeed = 22;
    startinglen = 80;
    setdirection[1] = 0;
    setdirection[2] = 180;
    setdirection[3] = 0;
    setdirection[4] = 180;
    setdirection[5] = 0;
    setdirection[6] = 180;
    centermoves = 1;
    movespeed = 60;
}
timer = rate - 5;
