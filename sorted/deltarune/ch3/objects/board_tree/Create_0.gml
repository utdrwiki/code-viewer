scr_darksize();
active = 0;
buffer = 0;
myhealth = 1;
wither = 0;
defense = 3;
depth = 999990;
sprite_index = spr_board_b1tree_left;
image_speed = 0.125;
if (room == room_board_dungeon_2 || room == room_board_dungeon_3)
    sprite_index = spr_board_b2dungeontree;
dir = choose(0, 1);
kris = 0;
sndbuff = 0;
pauseAnim = 0;
if (scr_swordroom())
{
    image_speed = 0;
    image_index = 0;
}
remspeed = image_speed;
init = 0;
