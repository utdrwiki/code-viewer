ease_inout_expo = function(argument0, argument1, argument2, argument3) //gml_Script_ease_inout_expo
{
    argument0 /= (argument3 * 0.5)
    if (argument0 < 1)
        return (((argument2 * 0.5) * power(2, (10 * (argument0 - 1)))) + argument1);
    argument0 -= 1
    return (((argument2 * 0.5) * ((-(power(2, (-10 * argument0)))) + 2)) + argument1);
}

