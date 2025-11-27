scr_board_depth();
if (room == room_board_dungeon_3 && sprite_index == spr_board_miniboss_wall_board3)
    depth = obj_mainchara_board.depth + 1000;
if (con == 1)
{
    image_index -= 0.5;
    if (image_index < 0)
        instance_destroy();
}
