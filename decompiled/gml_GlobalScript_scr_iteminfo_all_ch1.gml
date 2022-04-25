scr_iteminfo_all_ch1 = function() //gml_Script_scr_iteminfo_all_ch1
{
    for (i = 0; i < 12; i += 1)
    {
        itemid = global.item[i]
        scr_iteminfo_ch1(itemid)
        global.itemnameb[i] = itemnameb
        global.itemdescb[i] = itemdescb
        global.itemvalue[i] = value
        global.itemusable[i] = usable
    }
    return;
}

