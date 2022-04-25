scr_spell_overworld_ch1 = function(argument0) //gml_Script_scr_spell_overworld_ch1
{
    w = argument0
    usable = false
    switch argument0
    {
        case 0:
            break
        case 2:
            scr_healitem_ch1(global.charselect, 100)
            break
        default:

    }

    return;
}

