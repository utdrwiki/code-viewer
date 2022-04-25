scr_lweaponeq_ch1 = function(argument0, argument1) //gml_Script_scr_lweaponeq_ch1
{
    if (argument0 >= 0)
        global.litem[argument0] = global.lweapon
    global.lweapon = argument1
    if (global.lweapon == 2)
        global.lwstrength = 1
    if (global.lweapon == 6)
        global.lwstrength = 1
    if (global.lweapon == 7)
        global.lwstrength = 1
    script_execute(gml_Script_scr_litemname_ch1)
    return;
}

