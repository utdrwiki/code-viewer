function scr_swordroom()
{
    if (room == room_board_dungeon_2 || room == room_board_dungeon_3 || room == room_board_sword_intro || room == room_board_1_sword || room == room_board_1_sword_trees || room == room_board_preshadowmantle || room == room_board_preshadowmantle_repeat || room == room_shadowmantle || room == room_board_prepostshadowmantle || room == room_board_postshadowmantle || room == room_board_2_sword || room == room_board_3_sword)
        return true;
    else
        return false;
}
