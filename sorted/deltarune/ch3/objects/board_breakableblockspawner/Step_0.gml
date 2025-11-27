if (active)
{
    if (made == 0)
    {
        made = 1;
        block = instance_create(x, y, obj_board_breakableblock);
        block.puzzleid = puzzleid;
        block.image_index = image_index;
    }
}
else if (made)
{
    safe_delete(block);
    made = 0;
}
