scr_randomtarget = function() //gml_Script_scr_randomtarget
{
    abletotarget = true
    if (global.charcantarget[0] == false && global.charcantarget[1] == false && global.charcantarget[2] == false)
        abletotarget = false
    mytarget = choose(0, 1, 2)
    if (abletotarget == true)
    {
        while (global.charcantarget[mytarget] == false)
            mytarget = choose(0, 1, 2)
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

