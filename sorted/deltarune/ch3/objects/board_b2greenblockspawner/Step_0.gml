if (active)
{
    if (!init)
    {
        _block = instance_create(x, y, obj_board_b2greenblock);
        _block.daddy = id;
        _block.boss = boss;
        _block.image_index = image_index;
        init = true;
    }
}
else
{
}
