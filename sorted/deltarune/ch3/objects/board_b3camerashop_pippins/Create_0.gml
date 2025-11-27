myinteract = 0;
con = 0;
image_speed = 0;
active = false;
buffer = 0;
scr_darksize();
mysolid = instance_create(x, y, obj_board_solid);
mysolid.sprite_index = sprite_index;
scr_darksize(mysolid);
