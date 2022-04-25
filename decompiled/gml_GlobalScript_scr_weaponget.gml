scr_weaponget = function(argument0) //gml_Script_scr_weaponget
{
    noroom = false
    var legacy = false
    var __i = 0
    if (legacy == false)
    {
        var __itemcount = 0
        __weapon[0] = argument0
        for (__i = 0; __i < 48; __i++)
        {
            if (global.weapon[__i] != 0)
            {
                __weapon[(__itemcount + 1)] = global.weapon[__i]
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
                    global.weapon[__i] = __weapon[__i]
                else
                    global.weapon[__i] = 0
            }
        }
    }
    else if legacy
    {
        loop = true
        global.weapon[48] = 999
        while (loop == true)
        {
            if (global.weapon[__i] == 0)
            {
                global.weapon[__i] = argument0
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
    script_execute(gml_Script_scr_weaponinfo_all)
    return;
}

