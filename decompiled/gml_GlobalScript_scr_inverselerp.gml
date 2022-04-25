scr_inverselerp = function(argument0, argument1, argument2) //gml_Script_scr_inverselerp
{
    if (argument1 == argument0)
        return 0;
    return ((argument2 - argument0) / (argument1 - argument0));
}

