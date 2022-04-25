scr_monster_change = function(argument0, argument1, argument2) //gml_Script_scr_monster_change
{
    global.monstertype[argument0] = argument1
    global.monsterinstancetype[argument0] = argument2
    scr_monster_statreset(argument0)
    scr_monster_makeinstance(argument0)
    return;
}

