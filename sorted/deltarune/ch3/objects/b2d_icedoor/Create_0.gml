myinteract = 0;
image_speed = 0;
active = false;
buffer = 0;
depth = 999998;
timer = 0;
con = 0;
marker = 0;
kris = 0;
drawblue = false;
drawblack = false;
drawtext = 0;
ttimer = 0;
texttimer = 0;
textcomplete = false;
visitinit = 0;
sndpause = 0;
deer = 0;
blackmarker = 0;
actinit = 0;
mysolid = instance_create(x, y, obj_board_solid);
with (mysolid)
{
    setxy_board(4480, 896);
    image_xscale = 6;
}
