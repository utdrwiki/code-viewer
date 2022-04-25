scr_litemcheck = function(argument0) //gml_Script_scr_litemcheck
{
    haveit = false
    itemcount = 0
    for (i = 0; i < 8; i += 1)
    {
        if (global.litem[i] == argument0)
            haveit = true
        if (global.litem[i] == argument0)
            itemcount += 1
    }
    return haveit;
}

