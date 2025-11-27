depth = 100001;
timer = 0;
con = 0;
damage = 1;
mysolid = 0;
active_hitbox = false;
updatetimer = 0;
spd = 8;
destroyonhit = true;
for (i = 0; i < 5; i += 1)
{
    remx[i] = x;
    remy[i] = y;
}
direction = point_direction(x, y, obj_board_controller.kris_object.x + 16, obj_board_controller.kris_object.y + 16);
siner = 0;
colorsiner = 0;
scr_darksize();
image_speed = 0;
krisonly = false;
if (room == room_board_2 || room == room_board_3)
    krisonly = true;
