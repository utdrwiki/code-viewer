scr_armorcheck_inventory_ch1 = function(argument0) //gml_Script_scr_armorcheck_inventory_ch1
{
    haveit = false
    itemcount = 0
    for (i = 0; i < 12; i += 1)
    {
        if (global.armor[i] == argument0)
            haveit = true
        if (global.armor[i] == argument0)
            itemcount += 1
    }
    return haveit;
}

