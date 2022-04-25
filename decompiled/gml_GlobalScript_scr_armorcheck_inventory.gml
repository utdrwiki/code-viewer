scr_armorcheck_inventory = function(argument0) //gml_Script_scr_armorcheck_inventory
{
    haveit = false
    itemcount = 0
    for (i = 0; i < 48; i += 1)
    {
        if (global.armor[i] == argument0)
            haveit = true
        if (global.armor[i] == argument0)
            itemcount += 1
    }
    return haveit;
}

