if (con == 0)
{
    if (place_meeting(x, y, obj_board_swordhitbox))
    {
        instance_create(x + 16, y + 16, obj_board_enemydefeatsplash);
        scr_board_marker(x, y, spr_board_stairs, 0, depth, 2);
        setxy(room_width, room_height);
    }
}
