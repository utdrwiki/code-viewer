scr_weaponcheck_inventory_ch1 = function(argument0) //gml_Script_scr_weaponcheck_inventory_ch1
{
    haveit = false
    itemcount = 0
    for (i = 0; i < 12; i += 1)
    {
        if (global.weapon[i] == argument0)
            haveit = true
        if (global.weapon[i] == argument0)
            itemcount += 1
    }
    return haveit;
}

