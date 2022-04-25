scr_litemget = function(argument0) //gml_Script_scr_litemget
{
    i = 0
    loop = true
    noroom = false
    global.litem[8] = 999
    while (loop == true)
    {
        if (global.litem[i] == 0)
        {
            global.litem[i] = argument0
            break
        }
        else if (i == 8)
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
    scr_litemname()
    return;
}

