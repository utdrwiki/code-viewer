scr_movetowards = function(argument0, argument1, argument2) //gml_Script_scr_movetowards
{
    if (argument0 == argument1)
        return argument0;
    else if (argument0 > argument1)
        return max((argument0 - argument2), argument1);
    else
        return min((argument0 + argument2), argument1);
}

