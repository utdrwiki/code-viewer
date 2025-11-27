config = 0;
timer = 0;
siner = 0;
delay = 40;
fallspeed = 3;
target = 3;
damage = 40;
var maxhealth = global.maxhp[1];
var curhealth = global.hp[1];
if (curhealth > (maxhealth / 2))
    damage = 40;
if (curhealth <= (maxhealth / 2))
    damage = 30;
if (curhealth <= 50)
    damage = 25;
image_angle = 270;
image_alpha = 0;
scr_size(2, 2);
with (obj_dw_church_knightclimb)
    swordcount++;
