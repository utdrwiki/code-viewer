scr_lrecover = function(argument0) //gml_Script_scr_lrecover
{
    recovered = argument0
    maxedout = 0
    if (global.lhp < global.lmaxhp)
        global.lhp += argument0
    else
        maxedout = 1
    if (global.lhp >= global.lmaxhp && maxedout == 0)
    {
        global.lhp = global.lmaxhp
        maxedout = 1
    }
    return;
}

