scr_keyitemget_ch1 = function(argument0) //gml_Script_scr_keyitemget_ch1
{
    i = 0
    loop = true
    noroom = false
    global.item[12] = 999
    while (loop == true)
    {
        if (global.keyitem[i] == 0)
        {
            global.keyitem[i] = argument0
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
    script_execute(gml_Script_scr_keyiteminfo_all_ch1)
    return;
}

