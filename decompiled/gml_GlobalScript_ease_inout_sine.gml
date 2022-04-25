ease_inout_sine = function(argument0, argument1, argument2, argument3) //gml_Script_ease_inout_sine
{
    return (((argument2 * 0.5) * (1 - cos(((pi * argument0) / argument3)))) + argument1);
}

