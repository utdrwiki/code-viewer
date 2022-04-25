scr_itemcheck_pocket = function(argument0) //gml_Script_scr_itemcheck_pocket
{
    haveit = false
    itemcount = 0
    for (var __i = 0; __i < global.flag[64]; __i += 1)
    {
        if (global.pocketitem[__i] == argument0)
            haveit = true
        if (global.pocketitem[__i] == argument0)
            itemcount += 1
    }
    return haveit;
}

