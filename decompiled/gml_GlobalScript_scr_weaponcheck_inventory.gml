scr_weaponcheck_inventory = function(argument0) //gml_Script_scr_weaponcheck_inventory
{
    haveit = false
    itemcount = 0
    for (i = 0; i < 48; i += 1)
    {
        if (global.weapon[i] == argument0)
            haveit = true
        if (global.weapon[i] == argument0)
            itemcount += 1
    }
    return haveit;
}

