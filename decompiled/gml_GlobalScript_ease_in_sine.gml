ease_in_sine = function(argument0, argument1, argument2, argument3) //gml_Script_ease_in_sine
{
    return ((argument2 * (1 - cos(((argument0 / argument3) * 1.5707963267948966)))) + argument1);
}

