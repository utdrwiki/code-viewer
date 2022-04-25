scr_spell_overworld = function(argument0) //gml_Script_scr_spell_overworld
{
    w = argument0
    usable = false
    switch argument0
    {
        case 0:
            break
        case 2:
            scr_healitem(global.charselect, 100)
            break
        default:

    }

    return;
}

