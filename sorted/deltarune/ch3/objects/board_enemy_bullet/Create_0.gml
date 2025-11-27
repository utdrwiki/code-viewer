depth = 100001;
timer = 0;
con = 0;
damage = 1;
mysolid = 0;
active_hitbox = false;
updatetimer = 0;
spd = 8;
destroyonhit = true;
siner = 0;
colorsiner = 0;
scr_darksize();
image_speed = 0;
red = 30975;
yellow = 65535;
krisonly = false;
if (room == room_board_2 || room == room_board_3)
    krisonly = true;
acthitboxtime = 5;
acthitboxtime = 1;
if (room == room_board_1 || room == room_board_2 || room == room_board_3)
{
    acthitboxtime = 1;
    active_hitbox = true;
}
