scr_itemcheck = function(argument0) //gml_Script_scr_itemcheck
{
    haveit = false
    itemcount = 0
    for (var __i = 0; __i < 12; __i += 1)
    {
        if (global.item[__i] == argument0)
            haveit = true
        if (global.item[__i] == argument0)
            itemcount += 1
    }
    return haveit;
}

