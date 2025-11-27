scr_depth();
if (init == 0)
{
    image_index = global.flag[itemflag];
    init = 1;
    if (!variable_instance_exists(id, "itemflag"))
        itemflag = -1;
    if (!variable_instance_exists(id, "itemtype"))
        itemtype = "item";
    if (!variable_instance_exists(id, "itemidchest"))
        itemidchest = 0;
    if (scr_debug())
    {
        if (itemidchest == -1 && (itemtype == "item" || itemtype == "armor"))
        {
            flag = true;
            itemidchest = 0;
        }
    }
}
if (myinteract == 0)
{
    if (close == 1)
        image_index = 0;
    close = 0;
}
