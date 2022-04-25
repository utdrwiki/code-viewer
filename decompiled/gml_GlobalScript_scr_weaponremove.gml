scr_weaponremove = function(argument0) //gml_Script_scr_weaponremove
{
    __i = 0
    __loop = 1
    __inventorysize = array_length_1d(global.weapon)
    while (__loop == 1)
    {
        if (global.weapon[__i] == argument0)
        {
            global.weapon[__i] = 0
            break
        }
        else if (i == __inventorysize)
        {
            __loop = 0
            break
        }
        else
        {
            __i += 1
            continue
        }
    }
    script_execute(gml_Script_scr_weaponinfo_all)
    return;
}

