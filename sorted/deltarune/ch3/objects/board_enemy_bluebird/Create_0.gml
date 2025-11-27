scr_board_enemy_init();
image_speed = 0;
depth = 100002;
show_outline = false;
bulletimer = 0;
target_x = x;
target_y = y;
hspd = 0;
vspd = 0;
pathspd = 8;
if (room == room_board_dungeon_2)
{
    y = obj_mainchara_board.y;
    if (obj_mainchara_board.x > (x - 32))
        obj_mainchara_board.x = x - 32;
    sprite_index = spr_board_blue_bird_waddle;
}
x = clamp(x, 128, 480);
y = clamp(y, 96, 256);
