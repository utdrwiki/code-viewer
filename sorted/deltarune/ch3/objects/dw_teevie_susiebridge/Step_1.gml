with (obj_board_parent)
    active = true;
if (smokekill > 0)
{
    smokekill--;
    with (obj_board_smokepuff)
        instance_destroy();
}
