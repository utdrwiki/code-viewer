image_blend = c_white;
myinteract = 0;
scr_darksize();
image_speed = 0;
active = true;
depth = 999998;
con = 0;
timer = 0;
mysolid = instance_create(x, y, obj_board_solid);
mysolid.image_xscale = 2;
mysolid.image_yscale = 2;
key = [];
array_push(key, instance_create(x - 32, y, obj_board_marker));
array_push(key, instance_create(x + 16, y - 32, obj_board_marker));
array_push(key, instance_create(x + 64, y, obj_board_marker));
for (var i = 0; i < array_length(key); i++)
{
    key[i].sprite_index = spr_board_keyhole;
    scr_darksize(key[i]);
    key[i].depth = depth + 1;
}
keystouse = 0;
read = 0;
dooropened = 0;
keytimer = 0;
nokeyholes = false;
sunmoonstone = 0;
if (room == room_board_1_sword)
{
    marker = scr_board_marker(x, y, sprite_index, image_speed, depth, image_xscale, 0);
    instance_destroy();
}
siner = 0;
failsafe = 0;
