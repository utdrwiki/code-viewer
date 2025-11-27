function scr_jevil_check()
{
    var item_knife = false;
    var item_tail = false;
    var chapter = 1;
    for (var i = 0; i < 3; i++)
    {
        var result = scr_get_ura_value(chapter, i);
        if (result == 0)
            continue;
        if (result == 3)
        {
            item_knife = true;
            item_tail = true;
            break;
        }
        else
        {
            if (!item_knife)
                item_knife = result == 1;
            if (!item_tail)
                item_tail = result == 2;
        }
    }
    if (item_knife)
        global.tempflag[36] = 2;
    else if (item_tail)
        global.tempflag[36] = 1;
}
