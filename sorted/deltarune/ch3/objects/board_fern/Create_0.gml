event_inherited();
scr_darksize();
buffer = 0;
myhealth = 1;
wither = 0;
defense = 1;
scr_depth_board();
if (place_meeting(x, y, object_index))
    instance_destroy();
dir = choose(0, 1);
kris = 0;
sndbuff = 0;
pauseAnim = 0;
if (room == room_board_1_sword || room == room_board_dungeon_2 || room == room_board_dungeon_3 || room == room_board_1_sword_trees)
{
    image_speed = 0;
    image_index = 0;
}
remspeed = image_speed;
boatsolid = instance_create(x, y, obj_board_boatsolid);
