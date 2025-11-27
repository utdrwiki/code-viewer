if (myinteract == 0)
{
    if (close == 1)
        image_index = 0;
    close = 0;
}
if (!init)
{
    if (scr_debug())
    {
        if (itemflag == 1999)
            noflag = true;
        if (itemidchest == 0)
        {
            needsitem = true;
            itemidchest = 1;
        }
    }
    if (tempchest)
        image_index = 0;
    init = 1;
}
