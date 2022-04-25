scr_armorget = function(argument0) //gml_Script_scr_armorget
{
    noroom = false
    var legacy = false
    var __i = 0
    if (legacy == false)
    {
        var __itemcount = 0
        __armor[0] = argument0
        for (__i = 0; __i < 48; __i++)
        {
            if (global.armor[__i] != 0)
            {
                __armor[(__itemcount + 1)] = global.armor[__i]
                __itemcount++
            }
        }
        if (__itemcount >= 48)
            noroom = true
        else
        {
            for (__i = 0; __i < 48; __i++)
            {
                if (__i <= __itemcount)
                    global.armor[__i] = __armor[__i]
                else
                    global.armor[__i] = 0
            }
        }
    }
    else if legacy
    {
        loop = true
        global.armor[48] = 999
        while (loop == true)
        {
            if (global.armor[__i] == 0)
            {
                global.armor[__i] = argument0
                break
            }
            else if (__i == 48)
            {
                noroom = true
                break
            }
            else
            {
                __i += 1
                continue
            }
        }
    }
    script_execute(gml_Script_scr_armorinfo_all)
    return;
}

