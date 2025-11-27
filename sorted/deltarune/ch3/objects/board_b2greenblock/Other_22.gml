if (boss == 1 && obj_b2greenx.solved == 0)
{
    success = 0;
    var obj = 414;
    var check = 0;
    var block1 = instance_place(x + 32, y, obj);
    if (i_ex(block1))
    {
        if (block1.image_index == 1)
            check = 1;
    }
    var block2;
    if (check == 1)
    {
        block2 = instance_place(x + 32, y + 32, obj);
        if (i_ex(block2))
        {
            if (block2.image_index == 3)
                check = 2;
        }
    }
    var block3;
    if (check == 2)
    {
        block3 = instance_place(x, y + 32, obj);
        if (i_ex(block3))
        {
            if (block3.image_index == 2)
                check = 3;
        }
    }
    if (check == 3)
    {
        success = 1;
        obj_b2greenx.solved = 1;
        with (obj_board_playercamera)
        {
            if (i_ex(collision_rectangle(x + 4, y + 4, (x + (camwidth * 32)) - 4, (y + (camheight * 32)) - 4, block1, false, true)) && i_ex(collision_rectangle(x + 4, y + 4, (x + (camwidth * 32)) - 4, (y + (camheight * 32)) - 4, block2, false, true)) && i_ex(collision_rectangle(x + 4, y + 4, (x + (camwidth * 32)) - 4, (y + (camheight * 32)) - 4, block3, false, true)))
                check = 4;
        }
    }
    if (check == 4)
    {
        success = 1;
        obj_b2greenx.solved = 1;
    }
}
