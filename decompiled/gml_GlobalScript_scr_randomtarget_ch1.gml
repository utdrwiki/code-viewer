scr_randomtarget_ch1 = function() //gml_Script_scr_randomtarget_ch1
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
    return;
}

