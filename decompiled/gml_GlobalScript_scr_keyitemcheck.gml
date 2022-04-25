scr_keyitemcheck = function(argument0) //gml_Script_scr_keyitemcheck
{
    haveit = false
    itemcount = 0
    for (i = 0; i < 12; i += 1)
    {
        if (global.keyitem[i] == argument0)
            haveit = true
        if (global.keyitem[i] == argument0)
            itemcount += 1
    }
    return haveit;
}

