scr_armorcheck_equipped = function(argument0, argument1) //gml_Script_scr_armorcheck_equipped
{
    var __wearing = 0
    if (global.chararmor1[argument0] == argument1)
        __wearing++
    if (global.chararmor2[argument0] == argument1)
        __wearing++
    return __wearing;
}

