ease_inout_quad = function(argument0, argument1, argument2, argument3) //gml_Script_ease_inout_quad
{
    argument0 /= (argument3 * 0.5)
    if (argument0 < 1)
        return (((argument2 * 0.5) * (argument0 * argument0)) + argument1);
    return ((((-argument2) * 0.5) * ((--argument0 * (argument0 - 2)) - 1)) + argument1);
}

