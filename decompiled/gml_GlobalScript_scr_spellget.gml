scr_spellget = function(argument0, argument1) //gml_Script_scr_spellget
{
    var __spellj = 0
    var __openslot = -1
    var __haveit = 0
    for (__spellj = 0; __spellj < 12; __spellj++)
    {
        if (global.spell[argument0][__spellj] == argument1)
            __haveit = 1
        if (__openslot == -1)
        {
            if (global.spell[argument0][__spellj] == 0)
                __openslot = __spellj
        }
    }
    if (__openslot >= 0 && __haveit == 0)
        global.spell[argument0][__openslot] = argument1
    return;
}

