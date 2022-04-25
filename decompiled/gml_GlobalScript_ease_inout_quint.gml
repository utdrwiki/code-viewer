ease_inout_quint = function(argument0, argument1, argument2, argument3) //gml_Script_ease_inout_quint
{
    argument0 /= (argument3 * 0.5)
    if (argument0 < 1)
        return (((argument2 * 0.5) * power(argument0, 5)) + argument1);
    return (((argument2 * 0.5) * (power((argument0 - 2), 5) + 2)) + argument1);
}

