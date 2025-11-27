image_speed = 0;
dir = 0;
con = 0;
timer = 0;
init = 0;
daddy = 0;
pushspeed = 8;
active = 0;
solved = 0;
grayed = 0;
mysolid = instance_create(x, y, obj_board_solid);
mysolid.sprite_index = sprite_index;
scr_darksize(mysolid);
if (image_xscale == 1)
    image_xscale = 2;
if (image_yscale == 1)
    image_yscale = 2;
scr_depth_board();
init = 0;
kr = 0;
pushed = false;
spineindex = 0;
spinetimer = 0;
fakeground = scr_board_marker(x, y, spr_board_b3fakedirt, 0, 999999, 2);
blushamt = -20;
