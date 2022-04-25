ease_inout_circ = function(argument0, argument1, argument2, argument3) //gml_Script_ease_inout_circ
{
    argument0 /= (argument3 * 0.5)
    if (argument0 < 1)
        return (((argument2 * 0.5) * (1 - sqrt((1 - (argument0 * argument0))))) + argument1);
    argument0 -= 2
    return (((argument2 * 0.5) * (sqrt((1 - (argument0 * argument0))) + 1)) + argument1);
}

