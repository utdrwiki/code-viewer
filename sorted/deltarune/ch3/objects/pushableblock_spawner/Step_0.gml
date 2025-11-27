if (active)
{
    onscreen = true;
    if (!init)
    {
        var _block = instance_create(x, y, obj_pushableblock_board);
        _block.daddy = id;
        _block.extflag = extflag;
        init = true;
    }
}
else
{
    if (onscreen == true)
    {
        if (!(x >= 128 && x <= 512 && y >= 64 && y <= 320))
            onscreen = false;
    }
    if (onscreen == false)
        init = false;
}
