function scr_inventoryspace()
{
    var freespace = 0;
    var inventoryspace = 12;
    for (var i = 0; i < inventoryspace; i++)
    {
        if (global.item[i] == 0)
            freespace++;
    }
    debug_message("from " + object_get_name(object_index) + ": scr_inventoryspace(): free inventory slots=" + string(freespace));
    return freespace;
}

function scr_pocketspace()
{
    var pocketspace = 0;
    for (var i = 0; i < global.flag[64]; i++)
    {
        if (global.pocketitem[i] == 0)
            pocketspace++;
    }
    debug_message("from " + object_get_name(object_index) + ": scr_pocketspace(): free pocket slots=" + string(pocketspace));
    return pocketspace;
}
