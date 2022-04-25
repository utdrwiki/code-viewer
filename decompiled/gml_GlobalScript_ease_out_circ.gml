ease_out_circ = function(argument0, argument1, argument2, argument3) //gml_Script_ease_out_circ
{
    argument0 = ((argument0 / argument3) - 1)
    return ((argument2 * sqrt((1 - (argument0 * argument0)))) + argument1);
}

