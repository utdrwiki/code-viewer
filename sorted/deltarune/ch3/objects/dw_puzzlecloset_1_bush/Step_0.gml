scr_depth_board();
if (place_meeting(x, y, obj_board_swordhitbox))
{
    instance_create(x + 16, y + 16, obj_board_enemydefeatsplash);
    instance_destroy();
}
