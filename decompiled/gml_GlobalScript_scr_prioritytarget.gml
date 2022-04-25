scr_prioritytarget = function(argument0, argument1, argument2) //gml_Script_scr_prioritytarget
{
    abletotarget = true
    if (global.charcantarget[0] == false && global.charcantarget[1] == false && global.charcantarget[2] == false)
        abletotarget = false
    mytarget = scr_weightedrandom(argument0, argument1, argument2)
    if (abletotarget == true)
    {
        while (global.charcantarget[mytarget] == false)
            mytarget = scr_weightedrandom(argument0, argument1, argument2)
    }
    else
        mytarget = 3
    global.targeted[mytarget] = true
    if (global.chapter >= 2 && mytarget != 3)
    {
        if global.charcantarget[0]
            global.targeted[0] = true
        if global.charcantarget[1]
            global.targeted[1] = true
        if global.charcantarget[2]
            global.targeted[2] = true
        mytarget = 4
    }
    return;
}

