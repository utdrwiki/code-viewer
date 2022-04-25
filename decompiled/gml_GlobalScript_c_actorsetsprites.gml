c_actorsetsprites = function(argument0, argument1, argument2, argument3, argument4) //gml_Script_c_actorsetsprites
{
    if (argument1 != 0)
        c_var_instance(argument0, "usprite", argument1)
    if (argument2 != 0)
        c_var_instance(argument0, "rsprite", argument2)
    if (argument3 != 0)
        c_var_instance(argument0, "dsprite", argument3)
    if (argument4 != 0)
        c_var_instance(argument0, "lsprite", argument4)
    return;
}

