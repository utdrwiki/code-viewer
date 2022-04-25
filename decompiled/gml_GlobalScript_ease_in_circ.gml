ease_in_circ = function(argument0, argument1, argument2, argument3) //gml_Script_ease_in_circ
{
    argument0 /= argument3
    return ((argument2 * (1 - sqrt((1 - (argument0 * argument0))))) + argument1);
}

