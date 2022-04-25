ease_out_cubic = function(argument0, argument1, argument2, argument3) //gml_Script_ease_out_cubic
{
    return ((argument2 * (power(((argument0 / argument3) - 1), 3) + 1)) + argument1);
}

