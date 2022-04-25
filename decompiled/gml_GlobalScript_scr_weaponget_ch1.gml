scr_weaponget_ch1 = function(argument0) //gml_Script_scr_weaponget_ch1
{
    i = 0
    loop = true
    noroom = false
    global.weapon[12] = 999
    while (loop == true)
    {
        if (global.weapon[i] == 0)
        {
            global.weapon[i] = argument0
            break
        }
        else if (i == 12)
        {
            noroom = true
            break
        }
        else
        {
            i += 1
            continue
        }
    }
    script_execute(gml_Script_scr_weaponinfo_all_ch1)
    return;
}

