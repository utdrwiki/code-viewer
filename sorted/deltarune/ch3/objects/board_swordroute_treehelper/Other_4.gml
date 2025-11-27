if (room == room_board_1_sword_trees)
{
    with (obj_mainchara_board)
    {
        sword = true;
        swordlv = other.swordlv;
        myhealth = other.myhealth;
        maxhealth = other.maxhealth;
        facing = other.facing;
    }
    for (var i = 0; i < 12; i++)
    {
        for (var ii = 0; ii < 8; ii++)
            var tree = instance_create_board(i, ii, obj_board_tree);
    }
    with (obj_board_tree)
    {
        image_index = 0;
        dir = 0;
    }
}
